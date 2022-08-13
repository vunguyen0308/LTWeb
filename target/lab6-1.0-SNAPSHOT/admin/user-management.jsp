<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<jsp:useBean id="role" scope="request" class="vn.hcmuaf.edu.fit.lab6.dao.RoleDao"/>
<jsp:useBean id="accountStatus" scope="request" class="vn.hcmuaf.edu.fit.lab6.dao.AccountStatusDao"/>
<!DOCTYPE html>
<html >

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin - User</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

    <link rel="stylesheet" href="css/style.css">

</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <jsp:include page="admin-slidebar.jsp"/>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <jsp:include page="admin-topbar.jsp"/>
            <!-- End of Topbar -->

            <!-- Begin Page Content -->
            <div class="container-fluid">
                <!-- Page Heading -->
                <div class="d-sm-flex align-items-center justify-content-between mb-2">
                    <h1 class="h3 mb-4 text-gray-800">User Management</h1>
                </div>

                <div class="mb-2">
                    <a href="javascript:" class="btn btn-primary btn-icon-split" data-toggle="modal" data-target="#addUserModal">
                            <span class="icon text-white-50">
                                <i class="fas fa-plus"></i>
                            </span>
                        <span class="text">Add New</span>
                    </a>
                </div>


                <!-- start table -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">User List</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th style="width: 5%">No.</th>
                                    <th style="width: 5%">Id</th>
                                    <th style="width: 20%">Username</th>
                                    <th style="width: 35%;">Email</th>
                                    <th style="width: 12%">Role</th>
                                    <th style="width: 15%;">Status</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="a" items="${listA}" varStatus="count">
                                    <tr>
                                        <td>${count.count}</td>
                                        <td>${a.userId}</td>
                                        <td>${a.username}</td>
                                        <td>${a.email}</td>
                                        <td>${role.getRoleByRoleId(a.isAdmin).role_name}</td>
                                        <td class="status-text">${accountStatus.getStatusAccountByStatusAccountId(a.status).sa_name}</td>
                                        <td class="text-center d-flex justify-content-center">
                                            <div class="dropdown no-arrow mr-2">
                                                <a class="dropdown-toggle" href="javascript:" role="button" id="dropdownMenuLink1"
                                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                                </a>
                                                <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                                     aria-labelledby="dropdownMenuLink">
                                                    <div class="dropdown-header">Another action</div>
                                                    <a class="dropdown-item  ${a.status == 1 ? "disabled": ""} active-account" href="javascript:activeAccount(this)" aid="${a.userId}" >Active account</a>
                                                    <c:if test="${a.status == 2}">
                                                        <a class="dropdown-item" href="ac">Enable</a>
                                                    </c:if>
                                                    <c:if test="${a.status != 2}">
                                                        <a class="dropdown-item" href="#">Disable</a>
                                                    </c:if>
                                                </div>
                                            </div>
                                            <button class="delete-icon" title="Delete" onclick="removeUser(this)" uid="${a.userId}"><i class="fa fa-trash"></i></button>
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

<!-- modal add user-->
<div id="addUserModal" class="modal fade" role="dialog">
    <div class="modal-dialog ">

        <!-- Modal content-->
        <div class="modal-content">
            <form style="margin: 0" action="addUser" method="post">
                <div class="modal-header">
                    <h4 class="modal-title">Add User</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="username"><Strong>User Name</Strong></label>
                        <input type="text" name="username" class="form-control" id="username"  placeholder="Enter product name">
                    </div>
                    <div class="form-group">
                        <label for="password"><Strong>Password</Strong></label>
                        <input type="text" name="password" class="form-control" id="password"  placeholder="Enter product name">
                    </div>
                    <div class="form-group">
                        <label for="email"><Strong>Email</Strong></label>
                        <input type="text" name="email" class="form-control" id="email"  placeholder="Enter product name">
                    </div>
                    <div class="form-group">
                        <label for="role"><Strong>Role</Strong></label>
                        <select name="role" id="role" class="form-control">
                            <option value="0">Is Customer</option>
                            <option value="1">Is Admin</option>
                        </select>
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


<script>

    function activeAccount(row) {
        var id = $(row).attr("aid");
        var status_text = $(row).closest("tr").find(".status-text");
        if(confirm("Are you sure you want to active this account?")){
            $.ajax({
                url: "/lab6_war_exploded/admin/ActiveAccount",
                method: "POST",
                data: {
                    id: id
                },
                success: function (data){
                    alert("Success");
                    status_text.html(data);

                },
                error: function (data){
                    alert("Active fail!");
                }
            });

        }

    }

</script>

<%--remove user--%>
<script>
    function removeUser(userRow) {
        var id = $(userRow).attr("uid");
        tr = $(userRow).closest("tr");
        if(confirm("Are you sure you want to delete?")){
            $.ajax({
                url: "/lab6_war_exploded/admin/removeUManagement",
                method: "POST",
                data: {
                    id: id
                },
                success: function (data){
                    tr.remove();
                },
                error: function (data){
                    alert("Delete fail!")
                }
            });

        }
    }
</script>
<%--//--%>



</body>

</html>
