<table id="dg" class="easyui-treegrid" style="width:99.5%;" toolbar="#toolbar">
    <thead>
        <tr>
            <th rowspan="2" field="ck" checkbox="true"></th>
            <th rowspan="2" data-options="field:'print_rfq',width:80,halign:'center',formatter:BtnPrint">Print QR</th>
            <th rowspan="2" data-options="field:'status',width:100,align:'center',formatter:statusformat,styler:statusStyle">Status</th>
            <th rowspan="2" data-options="field:'request_no',width:180,halign:'center'">QR No</th>
            <th rowspan="2" data-options="field:'request_date',width:100,halign:'center'">QR Date</th>
            <th rowspan="2" data-options="field:'request_name',width:150,halign:'center'">QR Name</th>
            <th rowspan="2" data-options="field:'po_no',width:150,halign:'center',formatter:BtnRfq">RFQ No</th>
            <th rowspan="2" data-options="field:'item_number',width:150,halign:'center'">Part No Supplier</th>
            <th rowspan="2" data-options="field:'item_name',width:150,halign:'center'">Description</th>
            <th rowspan="2" data-options="field:'item_family_name',width:100,halign:'center'">Product Family</th>
            <!-- <th rowspan="2" data-options="field:'supplier',width:200,halign:'center'">Supplier</th>
            <th rowspan="2" data-options="field:'qty',width:80,halign:'center'">Qty</th>
            <th rowspan="2" data-options="field:'uom',width:80,halign:'center'">UoM</th>
            <th rowspan="2" data-options="field:'volume',width:100,halign:'center'">An. Volume</th>
            <th rowspan="2" data-options="field:'sop_date',width:100,halign:'center'">SOP Date</th>
            <th rowspan="2" data-options="field:'eop_date',width:100,halign:'center'">EOP Date</th>
            <th rowspan="2" data-options="field:'oem',width:150,halign:'center'">Customer/OEM</th>
            <th rowspan="2" data-options="field:'project',width:120,halign:'center'">Project</th> -->
            <th rowspan="2" data-options="field:'remarks',width:200,halign:'center'">Remarks</th>
            <th colspan="4" data-options="field:'',width:100,halign:'center'">Approved</th>
            <th colspan="2" data-options="field:'',width:100,halign:'center'"> Created</th>
            <th colspan="2" data-options="field:'',width:100,halign:'center'"> Updated</th>
        </tr>
        <tr>
            <th data-options="field:'status_approved',width:80,align:'center', styler:cellStylerApproval, formatter:cellFormatterApproval">Status</th>
            <th data-options="field:'approved_by',width:120,align:'center'">By</th>
            <th data-options="field:'approved_to',width:120,align:'center'">Next</th>
            <th data-options="field:'approved_date',width:150,align:'center'">Date</th>
            <th data-options="field:'created_by',width:100,align:'center'"> By</th>
            <th data-options="field:'created_date',width:150,align:'center'"> Date</th>
            <th data-options="field:'updated_by',width:100,align:'center'"> By</th>
            <th data-options="field:'updated_date',width:150,align:'center'"> Date</th>
        </tr>
    </thead>
</table>

<div id="toolbar" style="height: 160px; padding:10px;">
    <!-- <div style="width: 100%; display: grid; grid-template-columns: auto auto auto; grid-gap: 5px; display: flex;"> -->
    <div style="width: 100%;">
        <fieldset style="width: 100%; border:2px solid #d0d0d0; margin-bottom: 5px; margin-top: 5px; border-radius:4px;">
            <legend><b>Form Filter Data</b></legend>
            <div style="float: left; width: 30%;">
                <div class="fitem">
                    <span style="width:35%; display:inline-block;">Period</span>
                    <input style="width:28%;" id="filter_from" value="<?= date("Y-m-01") ?>" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser, editable:false"> To
                    <input style="width:28%;" id="filter_to" value="<?= date("Y-m-t") ?>" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser, editable:false">
                </div>
                <div class="fitem">
                    <span style="width:35%; display:inline-block;"></span>
                    <a href="javascript:;" class="easyui-linkbutton" onclick="filter()"><i class="fa fa-search"></i> Filter Data</a>
                </div>
            </div>
            <div style="float: left; width: 30%;">
                <div class="fitem">
                    <span style="width:35%; display:inline-block;">RFQ No</span>
                    <input style="width:60%;" id="filter_request_no" class="easyui-combobox">
                </div>
            </div>
            <div style="float: left; width: 30%;">
                <div class="fitem">
                    <span style="width:35%; display:inline-block;">Part No</span>
                    <input style="width:60%;" id="filter_item_rm" class="easyui-combogrid">
                </div>
            </div>
        </fieldset>
        <?= $button ?>
    </div>
</div>

<div id="toolbar2">
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" onclick="append()"><i class="fa fa-plus"></i> Add</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" onclick="removeit()"><i class="fa fa-times"></i> Remove</a>
</div>

<!-- Insert & Update -->
<div id="dlg_insert" class="easyui-dialog" title="Add New" data-options="closed: true,modal:true" style="width: 1200px; height: 550px; padding:10px; left: 10px; top: 20px;">
    <form id="frm_insert" method="post" novalidate>
        <fieldset style="width:100%; border:1px solid #d0d0d0; margin-bottom: 10px; border-radius:4px; float: left;">
            <legend><b>Form Data</b></legend>
            <div style="width: 35%; float: left;">
                <div class="fitem">
                    <span style="width:35%; display:inline-block;">Request No</span>
                    <input style="width:60%;" name="request_no" id="request_no" readonly class="easyui-textbox" data-options="prompt: 'Automatic'" required>
                </div>
                <div class="fitem">
                    <span style="width:35%; display:inline-block;">Request Date</span>
                    <input style="width:60%;" name="request_date" id="request_date" value="<?= date("Y-m-d") ?>" required="" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser, editable:false">
                </div>
            </div>
            <div style="width: 35%; float: left;">
                <div class="fitem">
                    <span style="width:35%; display:inline-block;">Request Name</span>
                    <input style="width:60%;" name="request_name" id="request_name" value="<?= $this->session->name ?>" readonly class="easyui-textbox">
                </div>
                <div class="fitem">
                    <span style="width:35%; display:inline-block;">Expected Date</span>
                    <input style="width:60%;" name="expected_date" id="expected_date" value="<?= date("Y-m-d") ?>" required="" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser, editable:false">
                </div>
            </div>
        </fieldset>
        <table id="dg2" class="easyui-datagrid" style="width:100%;" title="Request for Quotation Lists" toolbar="#toolbar2"></table>
    </form>
</div>

<!-- Upload -->
<div id="dlg_upload" class="easyui-dialog" title="Upload Data" data-options="closed: true,modal:true" style="width: 500px; padding:10px; top: 20px;">
    <form id="frm_upload" method="post" enctype="multipart/form-data" novalidate>
        <fieldset style="width:100%; border:1px solid #d0d0d0; margin-bottom: 10px; border-radius:4px; float: left;">
            <legend><b>Form Data</b></legend>
            <div class="fitem">
                <span style="width:35%; display:inline-block;">File Upload</span>
                <input name="file_upload" style="width: 60%;" required="" accept=".xls" id="file_excel" class="easyui-filebox">
            </div>
        </fieldset>
    </form>
    <span style="float: left; color:green;">SUCCESS : <b id="p_success">0</b></span><span style="float: right; color:red;"> FAILED : <b id="p_failed">0</b></span>
    <div id="p_upload" class="easyui-progressbar" style="width:100%; margin-top: 10px;"></div>
    <center><b id="p_start">0</b> Of <b id="p_finish">0</b></center>
    <div id="p_remarks" title="History Upload" class="easyui-panel" style="width:100%; height:200px; padding:10px; margin-top: 10px;">
        <ul id="remarks">
        </ul>
    </div>
</div>

<!-- Detail -->
<div id="dlg_detail" class="easyui-dialog" title="Detail Data" data-options="closed: true,modal:true" style="width: 400px; height: 550px; padding:10px; top: 20px;">
    <fieldset style="width:99.5%; border:1px solid #d0d0d0; margin-bottom: 10px; border-radius:4px; float: left;">
        <legend><b>Detail RFQ</b></legend>
        <div class="fitem">
            <span style="width:35%; display:inline-block;">QR No</span>
            <b id="t_request_no">-</b>
        </div>
        <div class="fitem">
            <span style="width:35%; display:inline-block;">RFQ No</span>
            <b id="t_po_no">-</b>
        </div>
        <div class="fitem">
            <span style="width:35%; display:inline-block;">Part No Supplier</span>
            <b id="t_item_number">-</b>
        </div>
        <div class="fitem">
            <span style="width:35%; display:inline-block;">Part Name</span>
            <b id="t_item_name">-</b>
        </div>
        <div class="fitem">
            <span style="width:35%; display:inline-block;">Supplier</span>
            <b id="t_supplier">-</b>
        </div>
        <div class="fitem">
            <span style="width:35%; display:inline-block;">Product Family</span>
            <b id="t_item_family_name">-</b>
        </div>
        <div class="fitem">
            <span style="width:35%; display:inline-block;">Quantity</span>
            <b id="t_qty">-</b>
        </div>
        <div class="fitem">
            <span style="width:35%; display:inline-block;">Uom</span>
            <b id="t_uom">-</b>
        </div>
        <div class="fitem">
            <span style="width:35%; display:inline-block;">Annual Volume</span>
            <b id="t_volume">-</b>
        </div>
        <div class="fitem">
            <span style="width:35%; display:inline-block;">SOP Date</span>
            <b id="t_sop_date">-</b>
        </div>
        <div class="fitem">
            <span style="width:35%; display:inline-block;">EOP Date</span>
            <b id="t_eop_date">-</b>
        </div>
        <div class="fitem">
            <span style="width:35%; display:inline-block;">Customer / OEM</span>
            <b id="t_oem">-</b>
        </div>
        <div class="fitem">
            <span style="width:35%; display:inline-block;">Project</span>
            <b id="t_project">-</b>
        </div>
        <div class="fitem">
            <span style="width:35%; display:inline-block;">MPQ</span>
            <b id="t_mpq">-</b>
        </div>
        <div class="fitem">
            <span style="width:35%; display:inline-block;">MOQ</span>
            <b id="t_moq">-</b>
        </div>
        <div class="fitem">
            <span style="width:35%; display:inline-block;">Leadtime</span>
            <b id="t_leadtime">-</b>
        </div>
        <div class="fitem">
            <span style="width:35%; display:inline-block;">Currency</span>
            <b id="t_currency">-</b>
        </div>
        <div class="fitem">
            <span style="width:35%; display:inline-block;">Price</span>
            <b id="t_price">-</b>
        </div>
        <div class="fitem">
            <span style="width:35%; display:inline-block;">Remarks</span>
            <b id="t_remarks">-</b>
        </div>
        <div class="fitem">
            <span style="width:35%; display:inline-block;">Attachment 1</span>
            <a id="t_attachment_1" target="_blank">Download</a>
        </div>
        <div class="fitem">
            <span style="width:35%; display:inline-block;">Attachment 2</span>
            <a id="t_attachment_2" target="_blank">Download</a>
        </div>
        <div class="fitem">
            <span style="width:35%; display:inline-block;">Attachment 3</span>
            <a id="t_attachment_3" target="_blank">Download</a>
        </div>
    </fieldset>
</div>

<!-- PDF -->
<iframe id="printout" src="<?= base_url('purchase/request_for_quotations/print') ?>" style="width: 100%;" hidden></iframe>
<script>
    //Add Data
    function add() {
        $('#dlg_insert').dialog('open');
        $('#dg2').datagrid('loadData', []);

        flag = "add";

        request_no();
        addTable();
    }

   
    function request_no(){
        $.ajax({
            type: "post",
            url: "<?= base_url("purchase/purchase_request_rfq/request_no/" . $id_menu . "/add") ?>",
            dataType: "json",
            success: function (response) {
                $("#request_no").textbox('setValue', response.code);
            }
        });
    }

    function addTable(link = "") {
        var lastIndex;
        var dg = $('#dg2').datagrid({
            url: link,
            singleSelect: true,
            columns: [
                [{
                    field: 'item_number',
                    width: 200,
                    readonly: true,
                    halign: 'center',
                    title: "Part No Supplier",
                    editor: {
                        type: 'textbox',
                        options: {
                            required: true,
                        }
                    }
                }, {
                    field: 'item_name',
                    width: 150,
                    halign: 'center',
                    title: "Description",
                    editor: {
                        type: 'textbox',
                    }
                }, {
                    field: 'item_family_id',
                    width: 150,
                    halign: 'center',
                    title: "Product Family",
                    editor: {
                        type: 'combobox',
                        options: {
                            url: '<?php echo base_url('master/item_familys/reads'); ?>',
                            valueField: 'id',
                            textField: 'name',
                            prompt: 'Select Product Family',
                            required: true,
                        }
                    }
                }, {
                    field: 'supplier',
                    width: 150,
                    halign: 'center',
                    title: "Supplier",
                    editor: {
                        type: 'textbox',
                    }
                }, {
                    field: 'qty',
                    width: 80,
                    halign: 'center',
                    title: "qty",
                    editor: {
                        type: 'numberbox',
                        options: {
                            required: true,
                        }
                    }
                }, {
                    field: 'uom',
                    width: 80,
                    readonly: true,
                    halign: 'center',
                    title: "UoM",
                    editor: {
                        type: 'combobox',
                        options: {
                            url: '<?php echo base_url('master/uom/reads'); ?>',
                            valueField: 'name',
                            textField: 'name',
                            prompt: 'Select UoM',
                            required: true,
                        }
                    }
                }, {
                    field: 'volume',
                    width: 120,
                    halign: 'center',
                    title: "An. Volume",
                    editor: {
                        type: 'textbox',
                    }
                },{
                    field: 'sop_date',
                    width: 120,
                    halign: 'center',
                    title: "SOP Date",
                    editor: {
                        type: 'datebox',
                        options: {
                            formatter:myformatter,
                            parser:myparser
                        }
                    }
                },{
                    field: 'eop_date',
                    width: 120,
                    halign: 'center',
                    title: "EOP Date",
                    editor: {
                        type: 'datebox',
                        options: {
                            formatter:myformatter,
                            parser:myparser
                        }
                    }
                },{
                    field: 'oem',
                    width: 150,
                    halign: 'center',
                    title: "Customer/OEM",
                    editor: {
                        type: 'textbox',
                    }
                },{
                    field: 'project',
                    width: 120,
                    halign: 'center',
                    title: "Project",
                    editor: {
                        type: 'textbox',
                    }
                },{
                    field: 'remarks',
                    width: 200,
                    halign: 'center',
                    title: "Remarks",
                    editor: {
                        type: 'textbox'
                    }
                }]
            ],
            onClickRow: function(rowIndex) {
                if (lastIndex != rowIndex) {
                    $(this).datagrid('endEdit', lastIndex);
                    $(this).datagrid('beginEdit', rowIndex);
                }
                editIndex = rowIndex;
                lastIndex = rowIndex;
            },
            onBeginEdit: function(rowIndex, row) {
                var editors = $('#dg2').datagrid('getEditors', rowIndex);
            }
        });
    }

    var editIndex = undefined;

    function endEditing() {
        if (editIndex == undefined) {
            return true
        }
        if ($('#dg2').datagrid('validateRow', editIndex)) {
            $('#dg2').datagrid('endEdit', editIndex);
            editIndex = undefined;
            return true;
        } else {
            return false;
        }
    }

    function append() {
        if (endEditing()) {
            $('#dg2').datagrid('appendRow', {

            });
            editIndex = $('#dg2').datagrid('getRows').length - 1;
            $('#dg2').datagrid('selectRow', editIndex).datagrid('beginEdit', editIndex);
        }
    }

    function removeit() {
        if (editIndex == undefined) {
            return true;
        }
        $('#dg2').datagrid('cancelEdit', editIndex).datagrid('deleteRow', editIndex);
        editIndex = undefined;
    }

    //EDIT DATA
    function update() {
        var row = $('#dg').treegrid('getSelected');
        if (row) {
            if (row.datatable == "1") {
                if (row.status == "0") {
                    $('#dlg_insert').dialog('open');
                    $('#frm_insert').form('load', row);

                    flag = "update";

                    setTimeout(function() {
                        $('#request_no').textbox('setValue', row.request_no);
                    }, 2000);

                    addTable('<?= base_url('purchase/purchase_request_rfq/datatable_updates?request_no=') ?>' + window.btoa(row.request_no));
                } else {
                    toastr.error("You cannot update this data, because status Purchase Request is CONVERTED");
                }
            } else {
                toastr.error("Please Select Header of PR <br>" + row.request_no);
            }
        } else {
            toastr.warning("Please select one of the data in the table first!", "Information");
        }
    }

    //Delete Data
    function deleted() {
        var rows = $('#dg').treegrid('getSelections');
        if (rows.length > 0) {
            $.messager.confirm('Warning', 'Are you sure you want to delete this data?', function(r) {
                if (r) {
                    for (var i = 0; i < rows.length; i++) {
                        var row = rows[i];
                        if (row.state == "closed") {
                            toastr.error("Please Select Detail of <br>" + row.id);
                        } else if(row.status != "0"){
                            toastr.error("Data cannot deleted, because the status already converted");
                        } else {
                            $.ajax({
                                method: 'post',
                                url: '<?= base_url('purchase/purchase_request_rfq/delete') ?>',
                                data: {
                                    id: row.id,
                                    request_no: row.request_no,
                                    asset_code: row.asset_code
                                },
                                success: function(result) {
                                    readRequestno();
                                    var result = eval('(' + result + ')');
                                },
                                error: function(jqXHR, textStatus, errorThrown) {
                                    toastr.error(jqXHR.statusText);
                                    $.messager.alert("Error", jqXHR.statusText, 'error');
                                },
                                complete: function(data) {
                                    $('#dg').treegrid('reload');
                                }
                            });
                        }
                    }
                }
            });
        } else {
            toastr.warning("Please select one of the data in the table first!", "Information");
        }
    }

    //Upload Data
    function upload() {
        $('#dlg_upload').dialog('open');
    }

    function download_excel() {
        window.location.assign('<?= base_url('template/tmp_purchase_request_rfq.xls') ?>');
    }

    function filter() {
        var filter_from = $("#filter_from").datebox('getValue');
        var filter_to = $("#filter_to").datebox('getValue');
        var filter_request_no = $("#filter_request_no").combobox('getValue');
        var filter_item_rm = $("#filter_item_rm").combogrid('getValue');

        url = "?filter_from=" + filter_from + "&filter_to=" + filter_to + "&filter_request_no=" + filter_request_no + "&filter_item_rm=" + filter_item_rm;
        
        $('#dg').treegrid({
            url: '<?= base_url('purchase/purchase_request_rfq/datatables') ?>' + url,
            pagination: true,
            rownumbers: true,
            idField: 'id',
            treeField: 'request_no',
            fit: true,
            singleSelect: false,
            pageList: [20, 50, 100, 500, 1000],
            pageSize: 20,
            onBeforeLoad: function(row, param) {
                if (!row) {
                    param.id = 0;
                }
            },
        });

        $("#printout").contents().find('html').html("<center><br><br><br><b style='font-size:20px;'>Please Wait...</b></center>");
        $("#printout").attr('src', '<?= base_url('purchase/purchase_request_rfq/print') ?>' + url);
    }

    function pdf() {
        $("#printout").get(0).contentWindow.print();
    }

    function excel() {
        var filter_from = $("#filter_from").datebox('getValue');
        var filter_to = $("#filter_to").datebox('getValue');
        var filter_request_no = $("#filter_request_no").combobox('getValue');
        var filter_item_rm = $("#filter_item_rm").combogrid('getValue');

        url = "?filter_from=" + filter_from + "&filter_to=" + filter_to + "&filter_request_no=" + filter_request_no + "&filter_item_rm=" + filter_item_rm;
        window.location.assign('<?= base_url('purchase/purchase_request_rfq/print/excel') ?>' + url);
    }

    function print_pr() {
        var rows = $('#dg').treegrid('getSelected');
        if (rows.length > 0) {
            window.open("<?= base_url('purchase/purchase_request_rfq/print_request/') ?>" + window.btoa(rows.request_no), "_blank");
        }else{
            toastr.warning("Please select one of the data in the table first!", "Information");
        }
    }

    function reload() {
        window.location.reload();
    }

    function readRequestno() {
        $("#filter_request_no").combobox({
            url: '<?= base_url('purchase/purchase_request_rfq/readRequestno') ?>',
            valueField: 'request_no',
            textField: 'request_no',
            prompt: "Select Request No",
            icons: [{
                iconCls: 'icon-clear',
                handler: function(e) {
                    $(e.data.target).combobox('clear').combobox('textbox').focus();
                }
            }],
        });
    }

    function BtnRfq(val, row) {
        if(val != null && val != ''){
            var rfq = "rfqDetail('"+row.id+"')";
            return '<a class="btn btn-primary w-100" onClick="'+rfq+'" style="pointer-events: visible; opacity:1;"><i class="fa fa-list"></i> '+val+'</a>';
        }
    }

    function BtnPrint(val, row) {
        if(row.datatable == 1){
            return '<a class="btn btn-primary w-100" target="_blank" href="<?= base_url('purchase/purchase_request_rfq/print_request/') ?>'+btoa(row.request_no)+'" style="pointer-events: visible; opacity:1;"><i class="fa fa-print"></i> Print</a>';
        }
    }

    function rfqDetail(id){
        $.ajax({
            type: "post",
            url: "<?= base_url("purchase/purchase_request_rfq/rfqDetail") ?>",
            data: "id=" + id,
            dataType: "json",
            success: function (json) {
                $("#dlg_detail").dialog('open');
                $("#t_request_no").html(json.request_no);
                $("#t_po_no").html(json.po_no);
                $("#t_item_number").html(json.item_number);
                $("#t_item_name").html(json.item_name);
                $("#t_supplier").html(json.supplier);
                $("#t_item_family_name").html(json.item_family_name);
                $("#t_qty").html(json.qty);
                $("#t_uom").html(json.uom);
                $("#t_volume").html(json.volume);
                $("#t_sop_date").html(json.sop_date);
                $("#t_eop_date").html(json.eop_date);
                $("#t_oem").html(json.oem);
                $("#t_project").html(json.project);
                $("#t_mpq").html(json.mpq);
                $("#t_moq").html(json.moq);
                $("#t_leadtime").html(json.leadtime);
                $("#t_currency").html(json.currency);
                $("#t_price").html(json.price);
                $("#t_remarks").html(json.remarks);

                if(json.attachment_1 == "" || json.attachment_1 == null){
                    $("#t_attachment_1").hide();
                }

                if(json.attachment_2 == "" || json.attachment_2 == null){
                    $("#t_attachment_2").hide();
                }

                if(json.attachment_3 == "" || json.attachment_3 == null){
                    $("#t_attachment_3").hide();
                }
                
                $("#t_attachment_1").attr('href', "<?= base_url('assets/documents/purchase_order_rfq/') ?>" + json.attachment_1);
                $("#t_attachment_2").attr('href', "<?= base_url('assets/documents/purchase_order_rfq/') ?>" + json.attachment_2);
                $("#t_attachment_3").attr('href', "<?= base_url('assets/documents/purchase_order_rfq/') ?>" + json.attachment_3);
            }
        });
    }

    $(function() {
        filter();

        //Save Data
        $('#dlg_insert').dialog({
            buttons: [{
                text: 'Save All',
                iconCls: 'icon-ok',
                handler: function() {
                    $.ajax({
                        type: "post",
                        url: "<?= base_url("purchase/purchase_request_rfq/request_no/" . $id_menu . "/add") ?>",
                        dataType: "json",
                        success: function (response) {
                            // $("#request_no").textbox('setValue', response.code);
                            if(flag == "add"){
                                var request_no = response.code;
                            }else{
                                var request_no = $("#request_no").textbox('getValue');
                            }

                            var request_date = $("#request_date").datebox('getValue');
                            var request_name = $("#request_name").textbox('getValue');
                            var expected_date = $("#expected_date").datebox('getValue');

                            $("#dg2").datagrid('acceptChanges');
                            var rows = $('#dg2').datagrid('getRows');
                            var totalrows = rows.length;
                            endEditing();

                            for (let i = 0; i < totalrows; i++) {
                                if(rows[i].qty == 0){
                                    toastr.error("Qty Cannot 0");
                                    return false;
                                }
                            }

                            for (let i = 0; i < totalrows; i++) {
                                if (rows[i].item_number) {
                                    $.ajax({
                                        type: "post",
                                        url: '<?= base_url('purchase/purchase_request_rfq/create') ?>',
                                        data: {
                                            request_no: request_no,
                                            request_date: request_date,
                                            request_name: request_name,
                                            item_number: rows[i].item_number,
                                            item_name: rows[i].item_name,
                                            item_family_id: rows[i].item_family_id,
                                            supplier: rows[i].supplier,
                                            qty: rows[i].qty,
                                            uom: rows[i].uom,
                                            volume: rows[i].volume,
                                            sop_date: rows[i].sop_date,
                                            eop_date: rows[i].eop_date,
                                            oem: rows[i].oem,
                                            project: rows[i].project,
                                            expected_date: expected_date,
                                            remarks: rows[i].remarks
                                        },
                                        dataType: "json",
                                        success: function(result) {
                                            if((i+1) == totalrows){
                                                Swal.fire({
                                                    title: result.message,
                                                    icon: result.theme,
                                                    confirmButtonText: 'Ok',
                                                    allowOutsideClick: false,
                                                }).then((result) => {
                                                    if (result.isConfirmed) {
                                                        window.location.reload();
                                                    }
                                                });
                                            }
                                        }
                                    });
                                }
                            }

                            readRequestno();
                            $('#dg').treegrid('reload');
                            $('#dlg_insert').dialog('close');
                        }
                    });
                }
            }]
        });

        //Upload Data
        $('#dlg_upload').dialog({
            buttons: [{
                text: 'List Failed',
                handler: function() {
                    window.open('<?= base_url('purchase/purchase_request_rfq/uploadDownloadFailed') ?>', '_blank');
                }
            }, {
                text: 'Upload',
                iconCls: 'icon-ok',
                handler: function() {
                    $('#frm_upload').form('submit', {
                        url: '<?= base_url('purchase/purchase_request_rfq/upload') ?>',
                        onSubmit: function() {
                            if ($(this).form('validate') == false) {
                                return $(this).form('validate');
                            } else {
                                $.messager.progress({
                                    title: 'Please Wait',
                                    msg: 'Importing Excel to Database'
                                });
                            }
                        },
                        success: function(result) {
                            $.messager.progress('close');
                            //Clear File
                            $.ajax({
                                url: "<?= base_url('purchase/purchase_request_rfq/uploadclearFailed') ?>"
                            });
                            var json = eval('(' + result + ')');
                            requestData(json.total, json);

                            function requestData(total, json, number = 1, value = 0, success = 1, failed = 1) {
                                if (value < 100) {
                                    value = Math.floor((number / total) * 100);
                                    $('#p_upload').progressbar('setValue', value);
                                    $('#p_start').html(number);
                                    $('#p_finish').html(total);
                                    $.ajax({
                                        type: "POST",
                                        async: true,
                                        url: "<?= base_url('purchase/purchase_request_rfq/uploadCreate') ?>",
                                        data: {
                                            "data": json[number - 1]
                                        },
                                        cache: false,
                                        dataType: "json",
                                        success: function(result) {
                                            if (result.theme == "success") {
                                                $('#p_success').html(success);
                                                var title = "<b style='color: green;'>" + result.title + "</b> | " + result.message;
                                                requestData(total, json, number + 1, value, success + 1, failed + 0);
                                            } else {
                                                $('#p_failed').html(failed);
                                                var title = "<b style='color: red;'>" + result.title + "</b> | " + result.message;
                                                //Json Failed
                                                $.ajax({
                                                    type: "POST",
                                                    async: true,
                                                    url: "<?= base_url('purchase/purchase_request_rfq/uploadcreateFailed') ?>",
                                                    data: {
                                                        data: json[number - 1],
                                                        message: result.message
                                                    },
                                                    cache: false
                                                });

                                                requestData(total, json, number + 1, value, success + 0, failed + 1);
                                            }
                                            $("#p_remarks").append(title + "<br>");
                                        }
                                    });
                                }
                            }
                        }
                    });
                }
            }]
        });
        
        $('#filter_item_rm').combogrid({
            url: '<?= base_url('master/item_rm/reads') ?>',
            panelWidth: 600,
            idField: 'id',
            mode: 'remote',
            fitColumns: true,
            prompt: 'Choose Part No',
            columns: [
                [{
                    field: 'id',
                    title: 'Part No EBWS',
                    width: 100
                }, {
                    field: 'number',
                    title: 'Part No Supplier',
                    width: 200
                }, {
                    field: 'name',
                    title: 'Description',
                    width: 200
                }]
            ],
            icons: [{
                iconCls: 'icon-clear',
                handler: function(e) {
                    $(e.data.target).combogrid('clear').combogrid('textbox').focus();
                }
            }],
        });

        readRequestno();
    });

    //Format Datepicker
    function myformatter(date) {
        var y = date.getFullYear();
        var m = date.getMonth() + 1;
        var d = date.getDate();
        return y + '-' + (m < 10 ? ('0' + m) : m) + '-' + (d < 10 ? ('0' + d) : d);
    }
    //Format Datepicker
    function myparser(s) {
        if (!s) return new Date();
        var ss = (s.split('-'));
        var y = parseInt(ss[0], 10);
        var m = parseInt(ss[1], 10);
        var d = parseInt(ss[2], 10);
        if (!isNaN(y) && !isNaN(m) && !isNaN(d)) {
            return new Date(y, m - 1, d);
        } else {
            return new Date();
        }
    }

    function numberformat(value, row) {
        if (value != null) {
            const formatter = new Intl.NumberFormat('ja-JP', {
                minimumFractionDigits: 2
            });
            return "<b>" + formatter.format(value) + "</b>";
        }
    }

    function statusformat(value, row) {
        if (value == 0) {
            return "<b style='color:red;'>UNCONVERTED</b>";
        } else if (value == 1) {
            return "<b style='color:green;'>CONVERTED</b>";
        }
    }

    function statusStyle(value, row, index) {
        if (value == 0) {
            return 'background-color:#FFC8C8;';
        } else if (value == 1) {
            return 'background-color:#C8FFCC;';
        }
    }

    function cellFormatterApproval(val, row) {
        if(row.approved_to == ""){
            return 'Approved';
        } else if(row.approved_to == null){
            return '-';
        } else {
            return 'Checking';
        }
    };

    function cellStylerApproval(value, row, index) {
        if(row.approved_to == ""){
            return 'background: #53D636; color:white;';
        } else if(row.approved_to == null){
            return '';
        } else {
            return 'background: #FF5F5F; color:white;';
        }
    }
</script>