with Ada.Text_IO; use Ada.Text_IO;
with Project_Name.Version;
with Ada.Command_Line;
with GNAT.Regpat;
with GNAT.Strings;
with Ada.Directories;
with GNAT.Command_Line;
with GNAT.Calendar.Time_IO;
with Ada.Calendar;

package Project_Name.Helper is

   package GPR is
      VERSION : constant String := $VERSION;
      DATE    : constant String := $DATE;
   end GPR;
   Strict_Date  : aliased Boolean := False;

   Fail : Boolean := False;

   package README is
      function VERSION return String;
      function DATE return String;
      function Initialize return Boolean;
   end  README;

   procedure Getopt;

end Project_Name.Helper;
