function Add-HEATDepartment
{
    <#
        .SYNOPSIS
        Adds a department Busness object.
        .DESCRIPTION
        A simple wrapper to add a Department business object by providing department name.
        .PARAMETER departmentName
        Enter a string vaule which represents the deaprtment name.
        .EXAMPLE
        PS C:\>Add-HEATdepartment -departmentName 'Accomodation'
        adds the business object for Accomodation.
        .NOTES
        May want to include code in future
        .LINK
        https://github.com/ajclark-notabot/PSHEATAPI
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

        #check department doesnt already exist
        try
        {
            Get-HEATDepartment -departmentName $department -ErrorAction stop
        }#end try
        catch
        {
            #department doesnt exist so lets add it
            $data = @{Name = 'DepartmentName'; Value = $department }
            New-HEATBusinessObject -Type 'Department#' -data $data
        }#end catch

    }#end process

}#end function