# lamename.ps1

A lame powershell script to rename directories by prepending or appending text.

## Options

```
-sourcedir      [path]      The directory to be modified
-prepend        [string]    Text to prepend to directory name, if switch not passed, nothing prepended
-append         [string]    Text to append to directory name, if switch not passed, nothing will be appended
-recurse        [switch]    Default Off. Recursively do through all subdirectories
-write          [switch]    Default Off. Actually make the changes, by default when you do not pass this switch, you just get a safe preview
```

## Quick Example

Given a directory structure like the one provided in this folder

```
.\testdir
+---dir1
+---dir2
+---dir3withsub
    +---subdir1
        +---subsubdir1
```

```ps1
PS C:\Users\collin\lamename> .\lamename.ps1 -sourcedir .\testdir -prepend 'CLIENTNAME-' -append '-AUDIT1' -recurse
C:\Users\collin\jmoney\testdir\dir1 ==> C:\Users\collin\jmoney\testdir\CLIENTNAME-dir1-AUDIT1
C:\Users\collin\jmoney\testdir\dir2 ==> C:\Users\collin\jmoney\testdir\CLIENTNAME-dir2-AUDIT1
C:\Users\collin\jmoney\testdir\dir3withsub ==> C:\Users\collin\jmoney\testdir\CLIENTNAME-dir3withsub-AUDIT1
C:\Users\collin\jmoney\testdir\dir3withsub\subdir1 ==> C:\Users\collin\jmoney\testdir\dir3withsub\CLIENTNAME-subdir1-AUDIT1
C:\Users\collin\jmoney\testdir\dir3withsub\subdir1\subsubdir1 ==> C:\Users\collin\jmoney\testdir\dir3withsub\subdir1\CLIENTNAME-subsubdir1-AUDIT1
```

## Usage

- Download the .zip of this and extract it somewhere
- Open powershell and navigate to that directory (the goal is to run the script)

> I had to run `Set-ExecutionPolicy RemoteSigned` to run scripts like this! I do not know a better way

- Now you can start using the script

```ps1
.\lamename.ps1 -sourcedir .\testdir -prepend 'BEGINNING-' -append '-AUDIT1' -recurse
```

Options are denoted with a leading `-` and their value immediately follows the option after a space

So: 

```ps1
.\lamename.ps1 -sourcedir .\testdir -prepend 'abc'
```

Sets the option `prepend` to `abc`

```ps1
.\lamename.ps1 -sourcedir .\testdir -append 'xyz'
```

Sets the option `prepend` to `abc` _and_ `append` to `xyz`

```ps1
.\lamename.ps1 -sourcedir .\testdir -append 'xyz' -write
```

Sets the option `prepend` to `abc` _and_ `append` to `xyz` _and_ turns `write` on.

This is how you can compose commands in different ways for different cases.

Remember to actually make changes you must pass the `-write`, but always test first.

## Notes
