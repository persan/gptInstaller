package Project_Name.Readers.UDP_Readers is

   type UDP_Reader is new Project_Name.Readers.Reader with record
      Socket : GNAT.Sockets.Socket_Type;
   end record;

   procedure Open (Source  : in out UDP_Reader;
                   Address : GNAT.Sockets.Inet_Addr_Type;
                   Port    : GNAT.Sockets.Port_Type);

   procedure Close (Source : in out UDP_Reader);

   function Read (Source : UDP_Reader) return Project_Name.Messages.Project_Name_Message'Class;

end Project_Name.Readers.UDP_Readers;
