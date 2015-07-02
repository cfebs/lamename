param (
    [string]$sourcedir,
    [string]$append,
    [string]$prepend,
    [switch]$write,
    [switch]$recurse
)

if ($recurse) {
    $files = Get-ChildItem $sourcedir -Recurse
}
else {
    $files = Get-ChildItem $sourcedir
}

# PSIsContainer means only directories
$files | ?{ $_.PSIsContainer } | Foreach-Object {
    $original_path = $_.FullName
    $dir = $original_path | split-path -parent
    $name = $original_path | split-path -leaf
    $new_name = $name

    if ($append) {
        $new_name = "$($new_name)$($append)"
    }

    if ($prepend) {
        $new_name = "$($prepend)$($new_name)"
    }

    $new_path = "$dir\$new_name"

    Write-Host "$($original_path) ==> $($new_path)"
    if ($write) {
        Rename-Item $original_path $new_name
    }

}
