<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<body>
    <%@ page import="java.util.*" %>
    <%
        List<ArrayList<String>> post = (List<ArrayList<String>>) request.getAttribute("post");

    ArrayList<String> columnValues = new ArrayList<>();

    int numRows = post.size();

    // Determine the maximum number of columns dynamically
    int numCols = 0;
    for (ArrayList<String> row : post) {
        numCols = Math.max(numCols, row.size());
    }

    for (int col = 0; col < numCols; col++) {
        for (int row = 0; row < numRows; row++) {
            ArrayList<String> currentRow = post.get(row);

            // Check if the column index is within bounds for the current row
            if (col < currentRow.size()) {
                String element = currentRow.get(col);

                // Store the value in the list
                columnValues.add(element);
            }
        }
    }

    // Print the stored values
    //System.out.println("Values of every variable in the first column: " + columnValues);
    for (int i = 0; i < columnValues.size(); i=i+4) {
    	if (i==columnValues.size()-3) {
			return;
		}
    	else {
		
    	out.println(columnValues.get(i)+"\n"+columnValues.get(i+1)+"\n"+columnValues.get(i+2)+"\n"+columnValues.get(i+3)+"<br>");
    	}
	}
    %>
</body>
</html>
