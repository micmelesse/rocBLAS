#!/usr/bin/env groovy
// This shared library is available at https://github.com/ROCmSoftwarePlatform/rocJENKINS/
@Library('rocJenkins') _

// This is file for internal AMD use.
// If you are interested in running your own Jenkins, please raise a github issue for assistance.

import com.amd.project.*
import com.amd.docker.*
import java.nio.file.Path


rocBLASCI:
{

    def rocblas = new rocProject('rocBLAS', 'Debug')
    // customize for project
    rocblas.paths.build_command = './install.sh -lasm_ci -c -g'

    // Define test architectures, optional rocm version argument is available
    def nodes = new dockerNodes(['ubuntu'], rocblas)

    boolean formatCheck = true

    def compileCommand =
    {
        platform, project->

        commonGroovy = load "${project.paths.project_src_prefix}/.jenkins/Common.groovy"
        commonGroovy.runCompileCommand(platform, project)
    }

    buildProject(rocblas, formatCheck, nodes.dockerArray, compileCommand, null, null)

}
