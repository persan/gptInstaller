
--  This package is using GNAT.Command_Line
--
with GNAT.Strings;
package Project_Name.Command_Line is

   package Switches is
      Verbose          : aliased Boolean := False;
      Quiet            : aliased Boolean := False;
      Print_Version    : aliased Boolean := False;
      Print_Help       : aliased Boolean := False;
      Output_File      : aliased GNAT.Strings.String_Access;
      Output_Folder    : aliased GNAT.Strings.String_Access;
      Trace_Exceptions : aliased Boolean := False;
   end Switches;

   procedure Getopt;
   procedure OS_Exit (Success : Boolean := True);
   procedure Display_Help (Do_Exit : Boolean := True);

end Project_Name.Command_Line;
