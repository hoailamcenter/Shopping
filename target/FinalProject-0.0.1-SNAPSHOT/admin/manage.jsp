<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body>
    <header>
        <h1>Product Management</h1>
    </header>
    <div class="container">
        <table>
            <thead>
                <tr>
                    <th>ProductId</th>
                    <th>ProductName</th>
                    <th>ImgLink</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Category</th>
                    <th>Amount</th>
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>

        <form>
            <label for="productId">ProductId:</label>
            <input type="text" id="productId" name="productId" required>

            <label for="productName">ProductName:</label>
            <input type="text" id="productName" name="productName" required>

            <label for="imgLink">ImgLink</label>
            <input type="text" id="imgLink" name="imgLink" required>

            <label for="descript">Description:</label>
            <input type="text" id="descript" name="descript" required>

            <label for="price">Price:</label>
            <input type="text" id="price" name="price" required>

            <label for="productCategory">Category:</label>
            <select id="productCategory" name="productCategory" required>
                <option value="category1">1</option>
                <option value="category2">2</option>
                <option value="category3">3</option>
                <option value="category3">4</option>
                <option value="category3">5</option>
                <option value="category3">6</option>
                <option value="category3">7</option>
            </select>

            <label for="productQuantity">Amount:</label>
            <input type="number" id="productQuantity" name="productQuantity" required>

            <button type="button" onclick="addProduct()">Add</button>
            <button type="button" onclick="updateProduct()">Update</button>
            <button type="button" onclick="updateProduct()">Delete</button>
        </form>
    </div>

</body>
<style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #007BFF;
            color: #fff;
            text-align: center;
            padding: 1em 0;
        }

        .container {
            width: 80%;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(232, 221, 221, 0.871);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #007BFF;
            color: #fff;
        }

        form {
            margin-top: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
        }

        input, select {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            box-sizing: border-box;
        }

        button {
            background-color: #4caf50;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .action-buttons {
            margin-top: 20px;
        }
        
    </style>
</html>