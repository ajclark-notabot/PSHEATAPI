function Get-HEATDepartment
{
    <#
        .SYNOPSIS
        Returns a Department business object.
        .DESCRIPTION
        A simple wrapper to return Department business objects by providing the commonly expected department name.
        .PARAMETER departmentName
        Enter a stringn vaule which represents the deaprtment name.
        .EXAMPLE
        PS C:\>Get-HEATTask -departmentName 'Accomodation'
        Returns the business object for Accomodation.
        .NOTES
        May want to include code in future
    #>
    [CmdletBinding()]
    [OutputType([PSCustomObject])]
    param (
        [Parameter(Mandatory,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            Position = 0)]
        [Alias('name')]
        [string]$department
    )

    process
    {

        #ivanti uses departmentname on some BO's and department on others. may want to add the line below for pipelining.
        # Get-HEATMultipleBusinessObjects -Value $department -Type 'Department#' -Field 'DepartmentName' | Add-Member -MemberType AliasProperty -Name Department -Value departmentName -PassThru
        Get-HEATMultipleBusinessObjects -Value $department -Type 'Department#' -Field 'DepartmentName'

    }#end process

}