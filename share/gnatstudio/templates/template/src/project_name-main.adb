with Project_Name.Command_Line;
with Project_Name.Version;
with GNAT.Command_Line;
with GNAT.Exception_Traces;
with GNAT.Traceback.Symbolic;

with Ada.Text_IO; use Ada.Text_IO;

procedure Project_Name.Main is

   Executed : Boolean := False;

begin
   Command_Line.Getopt;
   if Command_Line.Switches.Trace_Exceptions then
      GNAT.Exception_Traces.Trace_On (GNAT.Exception_Traces.Every_Raise);
      GNAT.Exception_Traces.Set_Trace_Decorator (GNAT.Traceback.Symbolic.Symbolic_Traceback_No_Hex'Access);
   end if;

   if Command_Line.Switches.Print_Version then
      Put_Line (Project_Name.Version.VERSION);
      return;
   elsif Command_Line.Switches.Print_Help then
      Command_Line.Display_Help (False);
      return;
   end if;

   loop
      declare
         S : constant String := GNAT.Command_Line.Get_Argument (Do_Expansion => True);
      begin
         exit when S'Length = 0;
         Executed := True;
         Put_Line ("Got " & S);
      end;
   end loop;

   if not Executed then
      --  Print help if nothing was executed.
      Command_Line.Display_Help (False);
   end if;
end Project_Name.Main;
