<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <link href="NewPages/styles.css" rel="stylesheet" />
        <img src="NewPages/csu-logo.png" />
        <br />
        <br />
        <h1>
        CSU Semester and Class Schedule<br />
        </h1>
        <br />
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="semesterName" DataValueField="semesterID" AutoPostBack="True"></asp:DropDownList>
        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:Schedule_DBConnectionString %>' SelectCommand="SELECT [semesterName], [semesterID] FROM [semester]">
        </asp:SqlDataSource>
        <br />
        <br />
        <h1>
        Classes
        </h1>
        <br />
       
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource3">
            <ItemTemplate>
                <table class="GeneratedTable">
                                    <tbody>
                                        <tr>
                                            <td>
                                               <asp:Label Text='<%# Eval("classNumber") %>' runat="server" ID="classNumberLabel" /><br />
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <table class="GeneratedTable">
                                    <tbody>
                                        <tr>
                                            <td> 
                                            <asp:Label Text='<%# Eval("className") %>' runat="server" ID="classNameLabel" /><br />
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <table class="GeneratedTable">
                                    <tbody>
                                        <tr>
                                            <td>Credits:
                                            <asp:Label Text='<%# Eval("classCredits") %>' runat="server" ID="classCreditsLabel" /><br />
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <table class="GeneratedTable">
                                    <tbody>
                                        <tr>
                                            <td>
                                             <asp:Label Text='<%# Eval("classDesc") %>' runat="server" ID="classDescLabel" /><br />
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <table class="GeneratedTable">
                                    <thead>
                                        <tr>
                                            <th>CRN</th>
                                            <th>Section</th>
                                            <th>Day</th>
                                            <th>Time</th>
                                            <th>Location</th>
                                            <th>Intructor</th>
                                            <th>Begin/End Dates</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <asp:Label Text='<%# Eval("classCrn") %>' runat="server" ID="classCrnLabel" /><br />
                                            </td>
                                            <td>
                                                <asp:Label Text='<%# Eval("classSection") %>' runat="server" ID="classSectionLabel" /><br />
                                            </td>
                                            <td>
                                                <asp:Label Text='<%# Eval("classDate") %>' runat="server" ID="classDateLabel" /><br />
                                            </td>
                                            <td>
                                                <asp:Label Text='<%# Eval("classTime") %>' runat="server" ID="classTimeLabel" /><br />
                                            </td>
                                            <td>
                                                <asp:Label Text='<%# Eval("classLocation") %>' runat="server" ID="classLocationLabel" /><br />
                                            </td>
                                            <td>
                                                <asp:Label Text='<%# Eval("classInstructor") %>' runat="server" ID="classInstructorLabel" /><br />
                                            </td>
                                            <td>
                                                <asp:Label Text='<%# Eval("classBeginEnd") %>' runat="server" ID="classBeginEndLabel" /><br />
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
            </ItemTemplate>
        </asp:DataList>

        <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:Schedule_DBConnectionString3 %>' SelectCommand="SELECT [classSemester], [classNumber], [className], [classCredits], [classDesc], [classDate], [classTime], [classInstructor], [classSection], [classCrn], [classLocation], [classBeginEnd], [classType] FROM [classes] WHERE ([classSemester] = @classSemester) ORDER BY [classID]">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" DefaultValue="0" Name="classSemester" Type="Int32"></asp:ControlParameter>
            </SelectParameters>
        </asp:SqlDataSource>
        

                <br />
            </ItemTemplate>
            <SeparatorStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" />
        </asp:DataList>

       
        <br />
        <footer>
        © 2016 CSU Class Schedule. <br />
         </footer>
    </div>
    </form>
</body>
</html>
