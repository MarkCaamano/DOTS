﻿<%@ Page Title="" Language="C#" MasterPageFile="MasterPageStart.Master" AutoEventWireup="true" CodeBehind="timeout.aspx.cs" Inherits="DOTS.timeout" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2 style="margin-left: 10%;">Session Expired</h2>                   
<p style="margin-left: 10%;">
    <span>Your session has expired due to inactivity.</span> 
    <br /> 
    <br /> 
    <a href="index.aspx">Click here to login again</a> 
</p> 
</asp:Content>