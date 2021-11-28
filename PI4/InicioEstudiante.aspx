<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEstudiante.Master" AutoEventWireup="true" CodeBehind="InicioEstudiante.aspx.cs" Inherits="PI4.InicioStudent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <div class="container">
            <div class="page-header">
              <h1 class="all-tittles">Sistema Generador de Horarios <small>Inicio</small></h1>
                <p class="all-tittles">&nbsp;</p>
                 <article class="tile">
                <div class="tile-icon full-reset">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <i class="zmdi zmdi-trending-up">&nbsp;&nbsp; </i></div>
                <div class="tile-name all-tittles" style="width: 90%;">Notificaciones</div>
                <div class="tile-num full-reset">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="LabelSolicitudes" runat="server" Text="0"></asp:Label>
                </div>
             </article>
            </div>
        </div>
    </asp:Content>
