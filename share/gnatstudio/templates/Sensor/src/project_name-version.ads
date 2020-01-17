with GNAT.Source_Info;
with GNAT.Compiler_Version;
package Project_Name.Version is
   MAJOR   : constant String := "0";
   MINOR   : constant String := "0";
   PATCH   : constant String := "1";
   VERSION : constant String := MAJOR & "." & MINOR & "." & PATCH;
   DATE    : constant String := "2019-11-20";

   package Compiler_Version_Impl is new GNAT.Compiler_Version;
   Compiler_Version     : constant String := Compiler_Version_Impl.Version;
   Compilation_ISO_Date : constant String := GNAT.Source_Info.Compilation_ISO_Date;
end Project_Name.Version;
