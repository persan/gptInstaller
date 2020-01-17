with GNAT.Serial_Communications;
package Project_Name.Readers.Serial_Port_Readers is
   use GNAT.Serial_Communications;
   type Serial_Port_Reader is new  GNAT.Serial_Communications.Serial_Port  and Project_Name.Readers.Reader with record
      null;
   end record;

   procedure Open (Port      : Serial_Port_Reader;
                   Path      : Port_Name;
                   Rate      : Data_Rate        := B9600;
                   Bits      : Data_Bits        := CS8;
                   Stop_Bits : Stop_Bits_Number := One;
                   Parity    : Parity_Check     := None;
                   Block     : Boolean          := True;
                   Local     : Boolean          := True;
                   Flow      : Flow_Control     := None;
                   Timeout   : Duration         := 10.0);

   overriding procedure Close (Source : in out Serial_Port_Reader);

   overriding function Read (Source : Serial_Port_Reader) return Project_Name.Messages.Project_Name_Message'Class;

end Project_Name.Readers.Serial_Port_Readers;
