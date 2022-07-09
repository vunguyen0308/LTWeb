<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="role" scope="request" class="vn.hcmuaf.edu.fit.lab6.dao.RoleDao"/>
<!DOCTYPE html>
<html>
    
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

        <script language="javascript" type="text/javascript" src="vendors/flot/excanvas.min.js"></script>
        <script src="vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    </head>
    
    <body>
    <jsp:include page="/admin/admin-header.jsp"/>
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span3" id="sidebar">
                    <ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">
                        <li>
                            <a href="product-management"><i class="icon-chevron-right"></i> Product Management</a>
                        </li>
                        <li class="active">
                            <a href="user-management"><i class="icon-chevron-right"></i> User Management</a>
                        </li>

                    </ul>
                </div>
                <!--/span-->
                <div class="span9" id="content">
                    <div class="row-fluid">
                        <div class="alert alert-success">
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
                                    <li class="active">User Management</li>
                                </ul>
                            </div>
                        </div>
                    </div>

                     <div class="row-fluid">
                        <!-- block -->
                        <div class="block">
                            <div class="navbar navbar-inner block-header">
                                <div class="muted pull-left">User List Table</div>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12">
                                   <div class="table-toolbar">
                                      <div class="btn-group">
                                         <button type="button" class="btn btn-success"  data-toggle="modal" data-target="#addUserModal">Add New <i class="icon-plus icon-white"></i></button>
                                      </div>
                                   </div>
                                    
                                    <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example2">
                                        <thead>
                                            <tr>
                                                <th style="width: 5%">No.</th>
                                                <th style="width: 5%">Id</th>
                                                <th style="width: 30%">User Name</th>
                                                <th style="width: 30%">Email</th>
                                                <th style="">Role</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                        <c:forEach var="a" items="${listA}" varStatus="count">
                                            <tr class="odd gradeX">
                                                <td>${count.count}</td>
                                                <td>${a.userId}</td>
                                                <td>${a.username}</td>
                                                <td>${a.email}</td>
                                                <td>${role.getRoleByRoleId(a.isAdmin).role_name}</td>
                                                <td class="center">
                                                    <button class="edit-icon" ><i class="fa fa-pen"></i></button>
                                                    <button class="delete-icon" onclick="removeUser(this)" uid="${a.userId}"><i class="fa fa-trash"></i></button>
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
        <!--/.fluid-container-->

    <%--modal add user--%>
    <div id="addUserModal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-sm">

            <!-- Modal content-->
            <div class="modal-content">
                <form style="margin: 0" action="addUser" method="post">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Add User</h4>
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
                                    <option value="1">Is Admin</option>
                                    <option value="0">Is Customer</option>
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
    <%--//--%>

        <script src="vendors/jquery-1.9.1.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="vendors/datatables/js/jquery.dataTables.min.js"></script>


        <script src="assets/scripts.js"></script>
        <script src="assets/DT_bootstrap.js"></script>

        <script type="text/javascript">
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
                            alert("Product not exist")
                        }
                    });

                }
            }
        </script>

    </body>

</html>