pragma Ada_2012;
package body Project_Name.Readers.UDP_Readers is

   ----------
   -- Open --
   ----------

   procedure Open
     (Source : in out UDP_Reader; Address : GNAT.Sockets.Inet_Addr_Type;
      Port   :        GNAT.Sockets.Port_Type)
   is
   begin
      pragma Compile_Time_Warning (Standard.True, "Open unimplemented");
      raise Program_Error with "Unimplemented procedure Open";
   end Open;

   -----------
   -- Close --
   -----------

   procedure Close (Source : in out UDP_Reader) is
   begin
      pragma Compile_Time_Warning (Standard.True, "Close unimplemented");
      raise Program_Error with "Unimplemented procedure Close";
   end Close;

   ----------
   -- Read --
   ----------

   function Read
     (Source : UDP_Reader)
      return Project_Name.Messages.Project_Name_Message'Class
   is
   begin
      pragma Compile_Time_Warning (Standard.True, "Read unimplemented");
      return raise Program_Error with "Unimplemented function Read";
   end Read;

end Project_Name.Readers.UDP_Readers;
