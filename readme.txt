Coldfusion's DeserializeJSON function treats all JSON number fields as integers.
This can cause problems with overflow that Coldfusion tries to correct with inaccurrate scientific notation.
To get to the desired content it is nessesary to manipulate the JSON content as plain text and treat the content as a list.

My example provides two ways of finding the desired list location.

	1. Looping through the list, if the JSON content is provided with formatting

	2. Using ListGetAt(), if content is provided without any formatting
 
My example assumes that the desired field is present and that we only want the first occurance.
However, with enough information about data format, a combination of JSON object and list functions can process multiple, or optional, fields that have overflow. 