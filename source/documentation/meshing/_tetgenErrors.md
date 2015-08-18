## TetGen Errors
It may be the case where TetGen cannot mesh the given PolyData and it will crash. This could be for a number of reasons including an open surface or intersecting facets. 
In most cases, TetGen is able to detect the error, and it outputs information about the event to the terminal. If you have built SimVascular from source, look for the error code in the output to the terminal.
If you have not built from source, the best option is to try a smaller mesh edge size. It is likeley that the edge size specified is too large for certain parts of the model.

|Code |Message |Description |
|---|---|---|
|1 |Error: Out of Memory |Not enough memory available to complete the mesh. Try increasing the mesh size |
|2 |Please report this bug to Hang.Si@wias-berlin.de. Include the message above, your input data set, and the exact command line you used to run this program, thank you |This error was caused by an unknown bug to TetGen |  
|3 |A self-intersection was detected. Program stopped. Hint: use -d option to detect all self-intersections. |This failure was caused by an input error. |  
|4 |A very small input feature size was detected. Program stopped. Hint: use -T option to set a smaller tolerance. |This failure was caused by a possible input error. For example, there are two segments nearly intersecting each. other. If you want to ignore this possible error, set a smaller tolerance by the -T switch, default is $10^−8$. | 

If the error code given is error code 2, please contact Hang Si at Hang.Si@wias-berlin.de. Otherwise, contact the SimVascular supporters or report a bug on the SimVascular website.
