<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin - Product</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

    <link rel="stylesheet" href="css/style.css">

</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <%-- slidebar --%>
    <jsp:include page="admin-slidebar.jsp"/>

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <%--  topbar --%>
            <jsp:include page="admin-topbar.jsp"/>

            <!-- Begin Page Content -->
            <div class="container-fluid">
                <!-- Page Heading -->
                <div class="d-sm-flex align-items-center justify-content-between mb-2">
                    <h1 class="h3 mb-4 text-gray-800">Product Management</h1>
                </div>

                <div class="mb-2">
                    <a href="javascript:" class="btn btn-primary btn-icon-split" data-toggle="modal" data-target="#addProductModal">
                            <span class="icon text-white-50">
                                <i class="fas fa-plus"></i>
                            </span>
                        <span class="text">Add New</span>
                    </a>
                </div>


                <!-- start table -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Product List</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th style="width: 5%">No.</th>
                                    <th style="width: 5%">Id</th>
                                    <th style="width: 15%">Image</th>
                                    <th style="width: 30%;">Name</th>
                                    <th style="width: 10%">Quantity</th>
                                    <th style="width: 15%;">Price(USD)</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="p" items="${listP}" varStatus="count">
                                    <tr>
                                        <td>${count.count}</td>
                                        <td>${p.id}</td>
                                        <td><img width="60px" src="${p.img}" alt=""></td>
                                        <td>${p.name}</td>
                                        <td>${p.quantity}</td>
                                        <td>${p.sellPrice}</td>
                                        <td class="text-center">
                                            <button class="edit-icon" title="Edit" onclick="showInfo(this)" pid = ${p.id}><i class="fa fa-pen"></i></button>
                                            <button class="delete-icon" title="Delete" onclick="removeProduct(this)" pid = ${p.id}><i class="fa fa-trash"></i></button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <!-- end table -->

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<jsp:include page="admin-logout-modal.jsp"/>

<!--    modal add product-->
<div id="addProductModal" class="modal fade" role="dialog">
    <div class="modal-dialog ">

        <!-- Modal content-->
        <div class="modal-content">
            <form style="margin: 0" action="addProduct" method="post">
                <div class="modal-header">
                    <h4 class="modal-title">Add Product</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="productName"><Strong>Name</Strong></label>
                        <input type="text" name="productName" class="form-control" id="productName"  placeholder="Enter product name">
                    </div>
                    <div class="form-group">
                        <label for="productBrand"><Strong>Brand</Strong></label>
                        <select name="productBrand" id="productBrand" class="form-control">
                            <c:forEach var="c" items="${listC}">
                                <option value="${c.cId}">${c.cName}</option>
                            </c:forEach>
                        </select>
                        <input style="display: none" type="text" name="otherBrand" class="form-control mt-3" id="brandOther"  placeholder="Enter product brand">
                    </div>
                    <div class="form-group">
                        <label for="genderProduct"><Strong>Gender</Strong></label>
                        <input type="text" name="gender" class="form-control" id="genderProduct" placeholder="Enter gender">
                    </div>
                    <div class="form-group">
                        <label for="productOrigin"><Strong>Origin</Strong></label>
                        <input type="text" name="productOrigin" class="form-control" id="productOrigin" placeholder="Enter product origin">
                    </div>
                    <div class="form-group">
                        <label for="productConcentration"><Strong>Concentration</Strong></label>
                        <input type="text" name="productConcentration" class="form-control" id="productConcentration" placeholder="Enter product concentration">
                    </div>
                    <div class="form-group">
                        <label for="productCapacity"><Strong>Capacity</Strong></label>
                        <input type="text" name="productCapacity" class="form-control" id="productCapacity" placeholder="Enter product capacity">
                    </div>
                    <div class="form-group">
                        <label for="productDescription"><Strong>Description</Strong></label>
                        <input type="text" name="productDescription" class="form-control" id="productDescription" placeholder="Enter product description">
                    </div>
                    <div class="form-group">
                        <label for="productPrice"><Strong>Price</Strong></label>
                        <input type="text" name="productPrice" class="form-control" id="productPrice" placeholder="Enter product price">
                    </div>
                    <div class="form-group">
                        <label for="productSellPrice"><Strong>Sell Price</Strong></label>
                        <input type="text" name="productSellPrice" class="form-control" id="productSellPrice" placeholder="Enter product sell price">
                    </div>
                    <div class="form-group">
                        <label for="productStyle"><Strong>Style</Strong></label>
                        <input type="text" name="productStyle" class="form-control" id="productStyle" placeholder="Enter product style">
                    </div>
                    <div class="form-group">
                        <label for="productImage"><Strong>Image</Strong></label>
                        <input type="text" name="productImage" class="form-control" id="productImage" placeholder="Enter product image">
                    </div>
                    <div class="form-group">
                        <label for="productQuantity"><Strong>Quantity</Strong></label>
                        <input type="text" name="productQuantity" class="form-control" id="productQuantity" placeholder="Enter product quantity">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-success" >Add</button>
                </div>
            </form>
        </div>

    </div>
</div>
<!--//-->

<!--Edit modal-->
<div id="editProductModal" class="modal fade" role="dialog">
    <div class="modal-dialog ">

        <!-- Modal content-->
        <div class="modal-content">
            <form style="margin: 0" action="editProduct" method="post">
                <div class="modal-header">
                    <h4 class="modal-title">Edit Product</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-success save-btn" >Save</button>
                </div>
            </form>
        </div>

    </div>
</div>
<!--//-->


<!-- Bootstrap core JavaScript-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="vendor/datatables/jquery.dataTables.min.js"></script>
<script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="js/demo/datatables-demo.js"></script>


<!--show input other brand&-->
<script>
    let selectEl = document.getElementById('productBrand');

    selectEl.addEventListener('change', (e) => {
        if (e.target.value == '7') {
            document.getElementById('brandOther').style.display = 'block';
        } else {
            document.getElementById('brandOther').style.display = 'none';
        }
    });

</script>
<!--//-->

<%-- show modal edit --%>
<script>
    function showInfo(product) {
        var id = $(product).attr("pid");
        $.ajax({
            url: "/lab6_war_exploded/admin/showInfoProduct",
            method: "POST",
            data: {
                id: id
            },
            success: function (data){
                $('#editProductModal').find('.modal-body').html(data);
                $('#editProductModal').modal('show');
            },
            error: function (data){

            }
        });
    }
</script>
<%--//--%>

<%-- remove product--%>
<script >
    function removeProduct(row) {
        var id = $(row).attr("pid");
        tr = $(row).closest("tr");
        if(confirm("Are you sure you want to delete?")){
            $.ajax({
                url: "/lab6_war_exploded/admin/removePManagement",
                method: "POST",
                data: {
                    id: id
                },
                success: function (data){
                    tr.remove();
                },
                error: function (data){
                    alert("Delete fail")
                }
            });

        }
    }
</script>
<%--//--%>
</body>

</html>
