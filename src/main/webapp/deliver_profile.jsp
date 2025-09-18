<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Profile</title>
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      margin: 0;
      background-color: #f4f6f9;
    }

    .container {
      padding: 20px;
      max-width: 1200px;
      margin: 0 auto;
    }

    .profile-card {
    background-color: #007bff;
    color: white;
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: space-between;
    padding: 20px;
    border-radius: 12px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
    margin-bottom: 30px;
	}
	
	.profile-pic {
	    width: 120px;
	    height: 120px;
	    border-radius: 50%;
	    object-fit: cover;
	    border: 3px solid white;
	    margin-right: 20px;
	}
	
	.delivery-person-name {
	    margin: 0;
	}
	
	.profile-info {
	    display: flex;
	    flex-direction: column;
	    align-items: center;
	    gap: 10px;
	    font-size: 1.2em;
	    font-weight: bold;
	}
	
	.edit-profile-btn {
	    padding: 8px 16px;
	    border-radius: 5px;
	    background-color: #0056b3;
	    color: white;
	    border: none;
	    cursor: pointer;
	    transition: background-color 0.3s ease;
	    align-self: start;
	}
	
	.edit-profile-btn:hover {
	    background-color: #003d80;
	}

    h2 {
      color: #1976d2;
      margin-top: 40px;
    }

    .del-and-pick {
      display: flex;
      gap: 20px;
      justify-content: space-between;
      margin: 20px 0;
    }

    .card {
      flex: 1;
      padding: 20px;
      border-radius: 10px;
      color: white;
      font-weight: bold;
      display: flex;
      justify-content: space-between;
      align-items: center;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    }

    .card.purple { background-color: #6a4c93; }
    .card.pink { background-color: #e91e63; }
    .card.red { background-color: #f44336; }

    .order-status {
      font-size: 2em;
      font-weight: bold;
    }

    .status-text {
      font-size: 0.9em;
      margin-top: 5px;
    }

    .new-order-btn {
      background-color: #28a745;
      color: white;
      border: none;
      padding: 12px 25px;
      font-size: 1.1em;
      border-radius: 5px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    .new-order-btn:hover {
      background-color: #218838;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 30px;
    }

    th, td {
      padding: 15px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }

    th {
      background-color: #f1f1f1;
      color: #333;
      font-weight: bold;
    }

    td {
      font-style: italic;
      color: #555;
    }

    .update-btn, .delete-btn {
      padding: 10px 20px;
      border-radius: 5px;
      color: white;
      border: none;
      cursor: pointer;
      font-size: 0.9em;
      transition: transform 0.2s ease;
    }

    .update-btn {
      background-color: #4CAF50;
    }

    .update-btn:hover {
      transform: scale(1.05);
    }

    .delete-btn {
      background-color: #f44336;
    }

    .delete-btn:hover {
      transform: scale(1.05);
    }

  </style>
</head>
<body>

  <div class="container">
    
    <div class="profile-card">
    <img src="img/profilePic.jpg" alt="Profile Picture" class="profile-pic">
    <div class="profile-info">
        <p class="delivery-person-name">Deliver Name</p> 
        <a href="deliver_profile.jsp">  <!--                       edit profile page                     -->
            <button class="edit-profile-btn">Edit Profile</button>
        </a>
    </div>
</div>


    <h2>Delivery and Pickup Orders</h2>

    <div class="del-and-pick">
      <div class="card purple">
        <div>
          <div class="order-status">${inprogress}</div>
          <div class="status-text">In Progress</div>
        </div>
      </div>

      <div class="card pink">
        <div>
          <div class="order-status">${pending}</div>
          <div class="status-text">Pending</div>
        </div>
      </div>

      <div class="card red">
        <div>
          <div class="order-status">${complete}</div>
          <div class="status-text">Complete</div>
        </div>
      </div>
    </div>

    <h2>Orders</h2>

    <a href="select_new_orders.jsp">
      <button class="new-order-btn">+ Add New Order</button>
    </a>

    <table>
      <thead>
        <tr>
          <th>Order ID</th>
          <th>Customer ID</th>
          <th>Delivery Address</th>
          <th>Status</th>
          <th>Delivery Date</th>
          <th>Delivery Time</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="deliverice" items="${alldelivery}">
          <tr>
            <td>${deliverice.orderId}</td>
            <td>${deliverice.customerId}</td>
            <td>${deliverice.deliveryAddress}</td>
            <td>${deliverice.deliveryStatus}</td>
            <td>${deliverice.estimatedDateOfDelivery}</td>
            <td>${deliverice.estimatedTimeOfDelivery}</td>
            <td>
              <a href="updateStatus.jsp?id=${deliverice.orderId}&status=${deliverice.deliveryStatus}&date=${deliverice.estimatedDateOfDelivery}&time=${deliverice.estimatedTimeOfDelivery}">
                <button class="update-btn">Update</button>
              </a>
              <form action="delete" method="post" style="display: inline;">
                <input type="hidden" name="id" value="${deliverice.orderId}">
                <button class="delete-btn">Delete</button>
              </form>
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>

</body>
</html>
