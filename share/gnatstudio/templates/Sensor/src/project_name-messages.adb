with Project_Name.Messages.Key_Maps;
package body Project_Name.Messages is
   Key_Map : Key_Maps.Map;
   -----------
   -- Input --
   -----------

   function Input
     (S : not null access Ada.Streams.Root_Stream_Type'Class)
      return Project_Name_Message'Class
   is
      Key : Key_Type;
   begin
      Key_Type'Read (S, Key);
      if not Key_Map.Contains (Key) then
         raise Constraint_Error with "Invalid Key" & Key'Img;
      else
         return Dispatching_Constructor (Key_Map (Key), S);
      end if;
   end Input;

   ------------
   -- Output --
   ------------

   procedure Output
     (S    : not null access Ada.Streams.Root_Stream_Type'Class;
      Item : Project_Name_Message'Class)
   is
   begin
      Key_Type'Write (S, Item.Key);
      Project_Name_Message'Class'Write (S, Item);
   end Output;

   --------------
   -- Register --
   --------------

   procedure Register (Key : Key_Type; Tag : Ada.Tags.Tag) is
   begin
      Key_Map.Include (Key, Tag);
   end Register;

end Project_Name.Messages;
