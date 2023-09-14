$local:VERSIONS = @( Get-Content $PSScriptRoot/versions.json -Encoding utf8 -raw | ConvertFrom-Json )

# Docker image variants' definitions
# See: https://www.php.net/releases/index.php?json&max=100&version=8.2
$local:VARIANTS_MATRIX = @(
    foreach ($v in $local:VERSIONS) {
        @{
            base_image_tag = "$v-fpm-alpine"
            subvariants = @(
                @{ components = @() }
                @{ components = @( 'opcache', 'mysqli', 'gd', 'pdo', 'memcached', 'sockets' ) }
                @{ components = @( 'opcache', 'mysqli', 'gd', 'pdo', 'memcached', 'sockets', 'xdebug' ) }
            )
        }
    }
)
$VARIANTS = @(
    foreach ($variant in $VARIANTS_MATRIX){
        foreach ($subVariant in $variant['subvariants']) {
            @{
                # Metadata object
                _metadata = @{
                    base_image_tag = $variant['base_image_tag']
                    components = $subVariant['components']
                }
                # Docker image tag. E.g. '7.2-fpm-alpine3.10-opcache', '7.2-fpm-alpine3.10-mysqli'
                tag = @(
                    $variant['base_image_tag']
                    $subVariant['components'] | ? { $_ }
                ) -join '-'
                tag_as_latest = if ($variant['base_image_tag'] -eq $local:VARIANTS_MATRIX[0]['base_image_tag'] -and $subVariant['components'].Count -eq 0) { $true } else { $false }
            }
        }
    }
)

# Docker image variants' definitions (shared)
$VARIANTS_SHARED = @{
    buildContextFiles = @{
        templates = @{
            'Dockerfile' = @{
                common = $true
                passes = @(
                    @{
                        variables = @{}
                    }
                )
            }
        }
    }
}
