pragma Ada_2012;
package body Project_Name.Messages.Sample2_Messages is

   -----------
   -- Image --
   -----------

   overriding function Image (Item : Sample_Message) return String is
   begin
      return Item.Name & Item.Id'Img;
   end Image;

   ---------
   -- Key --
   ---------

   overriding function Key (Item : Sample_Message) return Key_Type is
   begin
      return Sample_Message_Identifier;
   end Key;

   -----------------
   -- Constructor --
   -----------------

   overriding function Constructor
     (S : not null access Ada.Streams.Root_Stream_Type'Class)
      return Sample_Message
   is
   begin
      return Ret : Sample_Message do
         Sample_Message'Read (S, Ret);
      end return;
   end Constructor;

begin
   Register (Sample_Message_Identifier, Sample_Message'Tag);
end Project_Name.Messages.Sample2_Messages;
