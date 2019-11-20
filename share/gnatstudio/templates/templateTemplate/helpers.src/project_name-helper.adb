with Ada.Text_IO; use Ada.Text_IO;
with Project_Name.Version;
with Ada.Command_Line;
with GNAT.Regpat;
with GNAT.Strings;
with Ada.Directories;
with GNAT.Command_Line;
with GNAT.Calendar.Time_IO;
with Ada.Calendar;

package body Project_Name.Helper is

   package body README is

      Actual_VERSION : GNAT.Strings.String_Access := new String'("TBD");
      Actual_DATE    : GNAT.Strings.String_Access := new String'("TBD");

      function VERSION return String is (Actual_VERSION.all);
      function DATE return String is (Actual_DATE.all);
      function Initialize return Boolean is
         Found   : Boolean := False;
         procedure Parse (Line : String) is
            use GNAT.Regpat;
            Matcher : Pattern_Matcher := Compile (".*?" &
                                                    "(Version|Revision)" &   -- 1
                                                    "[:\s]+?" &
                                                    "(\d+\.\d+\.\d+)" &      -- 2
                                                    "[/\s]+?" &
                                                    "(\d+-\d+-\d+).*", -- 3
                                                  Case_Insensitive);
            Matches : Match_Array (1 .. Paren_Count (Matcher));
         begin
            Match (Matcher, Line, Matches);
            if Matches (2) /= No_Match then
               Actual_VERSION := new String'(Line (Matches (2).First .. Matches (2).Last));
               Actual_DATE := new String'(Line (Matches (3).First .. Matches (3).Last));
               Found := True;
            end if;
         end;

         Inf     : Ada.Text_IO.File_Type;
      begin
         if Ada.Directories.Exists ("README.md") then
            Open (Inf, Ada.Text_IO.In_File, "README.md");
            while not End_Of_File (Inf) loop
               Parse (Get_Line (Inf));
               exit when Found;
            end loop;
            Close (Inf);
            return True;
         else
            Put_Line ("README.md: is missing.");
            return False;
         end if;
      end;
   end  README;

   use GNAT.Calendar.Time_IO;
   use Ada.Calendar;

   Command_Line_Parser : GNAT.Command_Line.Command_Line_Configuration;

   procedure Getopt is
   begin
      GNAT.Command_Line.Define_Switch (Command_Line_Parser, Strict_Date'Access, Long_Switch => "--strict-date", Help => "Check data against current date");
      GNAT.Command_Line.Getopt (Command_Line_Parser);
   end Getopt;

end;
