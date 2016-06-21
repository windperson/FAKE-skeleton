// include Fake lib
#r @"packages/FAKE/tools/FakeLib.dll"
open Fake

// Properties
let buildDir = "./build/"

// Targets
Target "Clean" (fun _ ->
    CleanDir buildDir
    trace "Clean build directory"
)

// Default target
Target "Default" (fun _ ->
    trace "Hello World from FAKE"
)

// Dependencies
"Clean"
    ==> "Default"

// start build
RunTargetOrDefault "Default"