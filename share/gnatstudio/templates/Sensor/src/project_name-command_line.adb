with GNAT.Command_Line;
with GNAT.OS_Lib;
package body Project_Name.Command_Line is
   use GNAT.Command_Line;

   Configuration : GNAT.Command_Line.Command_Line_Configuration;
   ------------
   -- Getopt --
   ------------

   procedure Getopt is
   begin
      GNAT.Command_Line.Getopt (Configuration);
   end Getopt;

   -------------
   -- OS_Exit --
   -------------

   procedure OS_Exit (Success : Boolean := True) is
   begin
      GNAT.OS_Lib.OS_Exit (if Success then 0 else 1);
   end OS_Exit;

   ----------------
   -- Print_Help --
   ----------------

   procedure Display_Help (Do_Exit : Boolean := True) is
   begin
      GNAT.Command_Line.Display_Help (Configuration);
      if Do_Exit then
         OS_Exit;
      end if;
   end Display_Help;

   procedure Initialize is
   begin
      Define_Switch (Configuration, Switches.Verbose'Access, "-v",  "--verbose", "Be verbose.");
      Define_Switch (Configuration, Switches.Quiet'Access, "-q", "--quiet", "Be quiet.");
      Define_Switch (Configuration, Switches.Print_Version'Access, "", "--version", "Print Version and exit.");
      Define_Switch (Configuration, Switches.Print_Help'Access, "-h", "--help", "Print help.");
      Define_Switch (Configuration, Switches.Trace_Exceptions'Access, "-T", "", "Trace exceptions.");
      Define_Switch (Configuration, Switches.Output_File'Access, "-d=", "", "Define output folder.", Argument => "FOLDER");
      Define_Switch (Configuration, Switches.Output_Folder'Access, "-o=", "", "Define output file.", Argument => "PATH");
   end Initialize;
begin
   Initialize;
end Project_Name.Command_Line;
