--Dargo Wang
--Project4
--I asked www.adaic.org to figure out how to generate random numbers.
--I asked perso.telecom-paristech.fr/pautet/Ada95/chap14.html to figure out printing stuff.

package radom is

   type BINARY_NUMBER is range 0..1;
   type BINARY_ARRAY is array (1..16) of BINARY_NUMBER;

   function Bin_To_Int (bArray : BINARY_ARRAY) return Integer;
   function Int_To_Bin (iValue : Integer) return BINARY_ARRAY;
   function "+" (Left, Right : BINARY_ARRAY) return BINARY_ARRAY;
   function "+" (Left : BINARY_ARRAY; Right : Integer) return BINARY_ARRAY;
   function "-" (Left, Right : BINARY_ARRAY) return BINARY_ARRAY;
   function "-" (Left : BINARY_ARRAY; Right : Integer) return BINARY_ARRAY;

   procedure Reverse_Bin_Arr (bArray : in out BINARY_ARRAY);
   procedure Print_Bin_Arr (bArray : in BINARY_ARRAY);

end radom;
