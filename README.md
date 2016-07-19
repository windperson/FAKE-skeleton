# FAKE-skeleton
a skeleton project for running FAKE : F# DSL for build tasks https://fsharp.github.io/FAKE/

## prerequisites
* macOS
    * Install [mono](): chose the option you want on http://fsharp.org/use/mac/
    * Install [paket](https://fsprojects.github.io/Paket/): the easiest way is via [homebrew](http://brew.sh).
        ```bash
        brew install paket
        ```
* Windows
    * Install or enable [Windows PowerShell](http://msdn.microsoft.com/en-us/powershell).
    * Be sure powershell script file execution permission is enabled: http://technet.microsoft.com/en-us/library/ee176961.aspx 
        ```
        Set-ExecutionPolicy RemoteSigned
        ```
## how to run
* macOS: ```./mono_build.sh [fsharp script file]```
* Windows: ```paket_build.ps1 [fsharp script file]```