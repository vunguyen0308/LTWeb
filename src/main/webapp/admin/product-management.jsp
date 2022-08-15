<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html class="no-js">
    
    <head>
        <title>Admin</title>
        <!--favicon-->
        <link rel="icon" href="./images/favicon.ico">
        <!-- Bootstrap -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
        <link href="assets/styles.css" rel="stylesheet" media="screen">
        <link href="assets/DT_bootstrap.css" rel="stylesheet" media="screen">
        <!--font-->
        <link rel="stylesheet" href="fonts/fontawesome-5.15.4/css/all.min.css">

        <script src="vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>

    </head>
    
    <body>
    <jsp:include page="/admin/admin-header.jsp"/>
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span3" id="sidebar">
                    <ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">
                        <li class="active">
                            <a href="product-management"><i class="icon-chevron-right"></i> Product Management</a>
                        </li>

                        <li>
                            <a href="user-management"><i class="icon-chevron-right"></i> User Management</a>
                        </li>


                    </ul>
                </div>
                
                <!--/span-->
                <div class="span9" id="content">
                    <div class="row-fluid">
                        <div id="successAction" class="alert alert-success">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
                            <h4>Success</h4>
                        	The operation completed successfully</div>

                        	<div class="navbar">
                            	<div class="navbar-inner">
	                                <ul class="breadcrumb">
	                                    <i class="icon-chevron-left hide-sidebar"><a href='#' title="Hide Sidebar" rel='tooltip'>&nbsp;</a></i>
	                                    <i class="icon-chevron-right show-sidebar" style="display:none;"><a href='#' title="Show Sidebar" rel='tooltip'>&nbsp;</a></i>
	                                    <li>
	                                        <a href="#">Admin</a> <span class="divider">/</span>
	                                    </li>
	                                    <li class="active">Product Management</li>
	                                </ul>
                            	</div>
                        	</div>
                    	</div>

                    <div class="row-fluid">
                        <!-- block -->
                        <div class="block">
                            <div class="navbar navbar-inner block-header">
                                <div class="muted pull-left">Product List Table</div>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12">
                                    <div class="table-toolbar">
                                        <div class="btn-group">
                                            <a href="javascript:" id="add-p"><button class="btn btn-success">Add New <i class="icon-plus icon-white"></i></button></a>
                                        </div>
                                    </div>

                                            <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example2">
                                                <thead>
                                                <tr>
                                                    <th style="width: 5%">No.</th>
                                                    <th style="width: 5%">Id</th>
                                                    <th style="width: 15%">Image</th>
                                                    <th style="width: 30%">Name</th>
                                                    <th style="width: 10%;">Quantity</th>
                                                    <th style="width: 15%">Price(USD)</th>
                                                    <th>Action</th>

                                                </tr>
                                                </thead>
                                                <tbody>

                                                <c:forEach var="p" items="${listP}" varStatus="count">
                                                <tr class="odd gradeX">
                                                    <td>${count.count}</td>
                                                    <td>${p.id}</td>
                                                    <td><img width="60px" src="${p.img}" alt=""></td>
                                                    <td>${p.name}</td>
                                                    <td class="center">${p.quantity}</td>
                                                    <td class="center">${p.sellPrice}</td>
                                                    <td class="center">
                                                        <button class="edit-icon" title="Edit" onclick="showInfo(this)" pid=${p.id}><i class="fa fa-pen"></i></button>
                                                        <button class="delete-icon" title="Delete" onclick="removeProduct(this)" pid=${p.id}><i class="fa fa-trash"></i></button>
                                                    </td>
                                                </tr>
                                                </c:forEach>

                                            </tbody>
                                            </table>

                                </div>
                            </div>
                        </div>
                        <!-- /block -->
                    </div>


                </div>
            </div>
            <hr>

        </div>

<%--modal add product--%>
        <div id="addProductModal" class="modal fade" role="dialog">
            <div class="modal-dialog modal-sm">

                <!-- Modal content-->
                <div class="modal-content">
                    <form style="margin: 0" action="addProduct" method="post">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Add Product</h4>
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
                                <input style="display: none" type="text" name="otherBrand" class="form-control" id="brandOther"  placeholder="Enter product brand">
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
<%--//--%>

    <div id="editProductModal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-sm">

            <!-- Modal content-->
            <div class="modal-content">
                <form style="margin: 0" action="editProduct" method="post">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Edit Product</h4>
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


        <!--/.fluid-container-->
        <script src="vendors/jquery-1.9.1.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="vendors/datatables/js/jquery.dataTables.min.js"></script>

        <script src="assets/scripts.js"></script>
        <script src="assets/DT_bootstrap.js"></script>

        <script type="text/javascript">
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
                            alert("Product not exist")
                        }
                    });

                }
            }
        </script>


<%-- show add modal--%>
    <script>
        $('#add-p').click(function () {
            $('#addProductModal').modal('show');
        })
    </script>
<%--//--%>

<%--show input other brand--%>
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
<%--//--%>

    <script>
        function changeBrand(brand) {
            var id = $(brand).val();
            if(id == 7){
                $('#otherBrand').css('display','block');
            }else{
                $('#otherBrand').css('display','none');
            }
        }
    </script>

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

    </body>

</html>