<table id="dg" class="easyui-datagrid" style="width:100%;" toolbar="#toolbar">
    <thead>
        <tr>
            <th rowspan="2" field="ck" checkbox="true"></th>
            <th rowspan="2" data-options="field:'details',width:90,align:'center', formatter:btnDetails">Detail</th>
            <th rowspan="2" data-options="field:'journal_date',width:100,align:'center'">Posting Date</th>
            <th rowspan="2" data-options="field:'number',width:140,align:'center'">Voucher No</th>
            <th rowspan="2" data-options="field:'company_id',width:120,halign:'center'">Company ID</th>
            <th rowspan="2" data-options="field:'company_name',width:200,halign:'center'">Company Name</th>
            <th rowspan="2" data-options="field:'remarks',width:200,halign:'center'">Remarks</th>
            <th rowspan="2" data-options="field:'local_debit',width:100,halign:'center',align:'right',formatter:numberformatDefaultIdr">Debit</th>
            <th rowspan="2" data-options="field:'local_credit',width:100,halign:'center',align:'right',formatter:numberformatDefaultIdr">Credit</th>
            <th colspan="3" data-options="field:'',width:100,halign:'center'"> Approval</th>
            <th colspan="2" data-options="field:'',width:100,halign:'center'"> Created</th>
            <th colspan="2" data-options="field:'',width:100,halign:'center'"> Updated</th>
        </tr>
        <tr>
            <th data-options="field:'approved_by',width:100,align:'center'"> By</th>
            <th data-options="field:'approved',width:100,align:'center', styler:approvedStyle, formatter:approvedFormat"> Status</th>
            <th data-options="field:'approved_date',width:150,align:'center'"> Date</th>
            <th data-options="field:'created_by',width:100,align:'center'"> By</th>
            <th data-options="field:'created_date',width:150,align:'center'"> Date</th>
            <th data-options="field:'updated_by',width:100,align:'center'"> By</th>
            <th data-options="field:'updated_date',width:150,align:'center'"> Date</th>
        </tr>
    </thead>
</table>

<div id="toolbar" style="height: 200px; padding: 10px;">
    <!-- <div style="width: 100%; display: grid; grid-template-columns: auto auto auto; grid-gap: 5px; display: flex;"> -->
    <div style="width: 100%;">
        <fieldset style="width: 80%; border:2px solid #d0d0d0; margin-bottom: 5px; margin-top: 5px; border-radius:4px;">
            <legend><b>Form Filter Data</b></legend>
            <div style="width:50%; float:left;">
                <div class="fitem">
                    <span style="width:35%; display:inline-block;">Posting Date</span>
                    <input style="width:28%;" id="filter_from" class="easyui-datebox" value="<?= date("Y-m-01") ?>" data-options="formatter:myformatter,parser:myparser, editable:false"> To
                    <input style="width:28%;" id="filter_to" class="easyui-datebox" value="<?= date("Y-m-t") ?>" data-options="formatter:myformatter,parser:myparser, editable:false">
                </div>
                <div class="fitem">
                    <span style="width:35%; display:inline-block;">Journal Type</span>
                    <input style="width:60%;" id="filter_journal_type_id" class="easyui-combogrid">
                </div>
                <div class="fitem">
                    <span style="width:35%; display:inline-block;"></span>
                    <a href="javascript:;" class="easyui-linkbutton" onclick="filter()"><i class="fa fa-search"></i> Filter Data</a>
                    <!-- <a href="javascript:;" class="easyui-linkbutton" onclick="print_voucher()"><i class="fa fa-print"></i> Print Voucher</a> -->
                </div>
            </div>
            <div style="width:50%; float:left;">
                <div class="fitem">
                    <span style="width:35%; display:inline-block;">Company Name</span>
                    <input style="width:60%;" id="filter_company" class="easyui-combogrid" />
                </div>
                <div class="fitem">
                    <span style="width:35%; display:inline-block;">Voucher No</span>
                    <input style="width:60%;" id="filter_voucher" class="easyui-textbox" />
                </div>
            </div>
        </fieldset>
        <?= $button ?>
    </div>
</div>

<div id="toolbar2">
    <!-- <a href="javascript:void(0)" class="easyui-linkbutton" id="preview" data-options="plain:true" onclick="preview()"><i class="fa fa-eye"></i> Preview Journal</a> -->
</div>

<div id="toolbarDocumentNo">
    &nbsp; Total Amount : &nbsp;
    <input style="width:15%;" id="total_amount" readonly class="easyui-numberbox" data-options="precision:2,groupSeparator:',',decimalSeparator:'.'">
</div>

<!-- Insert -->
<div id="dlg_insert" class="easyui-dialog" title="Add New Posting Journal" data-options="closed: true,modal:true, fit:true" style="width: 100%; padding:10px; top: 0; left: 0;">
    <form id="frm_insert" method="post" novalidate>
        <fieldset style="width:100%; border:1px solid #d0d0d0; margin-bottom: 10px; border-radius:4px; float: left;" id="fieldset">
            <legend><b>Form Data</b></legend>
            <div style="width:30%; float:left;">
                <div class="fitem">
                    <span style="width:35%; display:inline-block;">Posting Date</span>
                    <input style="width:60%;" name="journal_date" id="journal_date" required="" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser, editable:false">
                </div>
                <div class="fitem">
                    <span style="width:35%; display:inline-block;">Voucher No</span>
                    <input style="width:60%;" name="number" id="number" readonly class="easyui-textbox">
                </div>
                <div class="fitem" hidden>
                    <span style="width:35%; display:inline-block;">Modul</span>
                    <input style="width:60%;" name="modul" id="modul" class="easyui-textbox" required>
                </div>
                <div class="fitem">
                    <span style="width:35%; display:inline-block;">Transaction Type</span>
                    <select style="width:60%;" name="journal_type" id="journal_type" required class="easyui-combobox" panelHeight="auto">
                        <option value="CL - SUPPLIER">SUPPLIER</option>
                        <option value="CL - CUSTOMER">CUSTOMER</option>
                    </select>
                </div>
                <div class="fitem">
                    <span style="width:35%; display:inline-block;"></span>
                    <a href="javascript:;" class="easyui-linkbutton" id="preview" onclick="previewData()"><i class="fa fa-search"></i> Preview Data</a>
                </div>
            </div>
            <div style="width:30%; float:left;">
                <div class="fitem">
                    <span style="width:35%; display:inline-block;">Company Name</span>
                    <input style="width:60%;" name="company_id" id="company_id" required="" class="easyui-combogrid">
                </div>
                <div class="fitem">
                    <span style="width:35%; display:inline-block;">Document No</span>
                    <input style="width:60%;" name="document_no" required id="document_no" class="easyui-combogrid">
                </div>
                <div class="fitem">
                    <span style="width:35%; display:inline-block;">Remarks</span>
                    <input style="width:60%;" name="remarks" id="remarks" class="easyui-textbox">
                </div>
            </div>
            <div style="width:30%; float:left;">
                <!-- Buat Validasi -->
                <div class="fitem" hidden>
                    <span style="width:35%; display:inline-block;">Total Debit</span>
                    <input style="width:60%;" id="local_debit" disabled class="easyui-numberbox">
                </div>
                <div class="fitem" hidden>
                    <span style="width:35%; display:inline-block;">Total Credit</span>
                    <input style="width:60%;" id="local_credit" disabled class="easyui-numberbox">
                </div>
            </div>
        </fieldset>

        <table id="dg2" class="easyui-datagrid" style="width:100%;" title="Journal Posting List" data-options="singleSelect: true" toolbar="#toolbar2" rownumbers="true" , idField="number" showFooter="true">
            <thead>
                <tr>
                    <!-- <th field="ck" checkbox="true">Posting</th> -->
                    <th data-options="field:'remove',width:80, formatter:removebtn">Action</th>
                    <th hidden data-options="field:'id',width:150,editor: {type: 'textbox'}">ID</th>
                    <th hidden data-options="field:'journal_type_id',width:150,editor: {type: 'textbox'}">ID</th>
                    <th data-options="field:'source',width:80,editor: {type: 'textbox'}">Source</th>
                    <th data-options="field:'document_no',width:150,editor: {type: 'textbox', options: {readonly: true}}">Document No</th>
                    <th data-options="field:'document_date',width:120,editor: {type: 'textbox', options: {readonly: true}}">Document Date</th>
                    <th data-options="field:'invoice_no',width:200,editor: {type: 'textbox', options: {readonly: true}}">Invoice No</th>
                    <th data-options="field:'invoice_date',width:120,editor: {type: 'textbox', options: {readonly: true}}">Invoice Date</th>
                    <th hidden data-options="field:'voucher_no',width:120,editor: {type: 'textbox', options: {readonly: true}}">Voucher No</th>
                    <th hidden data-options="field:'description',width:200,editor: {type: 'textbox', options: {readonly: true}}">Description</th>
                    <th data-options="field:'account_number',width:100, halign:'center', editor: {type: 'textbox', options: {readonly: true}}">Account No</th>
                    <th hidden data-options="field:'account_name',width:180, editor: {type: 'textbox', options: {readonly: true}}">Account Name</th>
                    <th hidden data-options="field:'company_id',width:100,editor: {type: 'textbox', options: {readonly: true}}">Company ID</th>
                    <th hidden data-options="field:'company_name',width:200,editor: {type: 'textbox', options: {readonly: true}}">Company Name</th>
                    <th data-options="field:'currency',width:80,editor: {type: 'textbox', options: {required: true, readonly: true}}">Currency</th>
                    <th data-options="field:'amount',width:100,halign:'center',align:'right',formatter:numberformatDefaultIdr,editor: {type: 'numberbox', options: {readonly: true, precision:2}}">Amount</th>
                    <th data-options="field:'adjustment',width:100,halign:'center',align:'right',formatter:numberformatDefaultIdr,editor: {type: 'numberbox', options: {required: true, precision:2, 
                        onChange: function(value) {
                            var dg = $('#dg2');
                            var row = dg.datagrid('getSelected');
                            var rowIndex = dg.datagrid('getRowIndex', row);

                            var ed = dg.datagrid('getEditor', {
                                index: rowIndex,
                                field: 'amount'
                            });

                            var ed2 = dg.datagrid('getEditor', {
                                index: rowIndex,
                                field: 'balance'
                            });

                            if(rowIndex == 0){
                                var balance = 0;
                            }else{
                                var indexBal = (rowIndex-1);
                                var rowData = dg.datagrid('getRows')[indexBal];
                                var balance = rowData.balance.toFixed(2);
                            }

                            var amount = $(ed.target).numberbox('getValue');
                            $(ed2.target).numberbox('setValue', (parseFloat(amount) + parseFloat(balance) + parseFloat(value)));
                        }
                    }}">Adjustment</th>
                    <th data-options="field:'balance',width:100,halign:'center',align:'right',formatter:numberformatDefaultIdr,editor: {type: 'numberbox', options: {readonly: true, precision:2}}">Balance</th>
                </tr>
            </thead>
        </table>

        <div style="width: 60%; float: left; margin-top:20px;">
            <a style="width: 20%;" class="easyui-linkbutton c2" onclick="preview()">Calculate to Journal</a>

            <br><br>
            <table id="dg4" class="easyui-datagrid" style="width:100%;" showFooter="true">
                <thead>
                    <tr>
                        <th data-options="field:'account_number',width:100,halign:'center'">Account No</th>
                        <th data-options="field:'account_name',width:200,halign:'center'">Account Name</th>
                        <th data-options="field:'description',width:250,halign:'center'">Description</th>
                        <th data-options="field:'local_debit',width:100,halign:'center',align:'right',formatter:numberformatDefaultIdr">Debit</th>
                        <th data-options="field:'local_credit',width:100,halign:'center',align:'right',formatter:numberformatDefaultIdr">Credit</th>
                        <th hidden data-options="field:'status_cl',width:80,halign:'center'">Status</th>
                    </tr>
                </thead>
            </table>
        </div>
    </form>
</div>

<div id="dlg_detail" class="easyui-window" title="Journal Detail" data-options="closed: true,modal:true" style="width: 1200px; height: 500px; top: 20px; left:10px;">
    <table id="dg3" class="easyui-datagrid" style="width:100%;">
        <thead>
            <tr>
                <th data-options="field:'journal_date',width:100,halign:'center'">Posting Date</th>
                <th data-options="field:'invoice_no',width:120,halign:'center'">Invoice No</th>
                <th data-options="field:'document_no',width:220,halign:'center'">Document No</th>
                <th data-options="field:'company_name',width:200,halign:'center'">Company Name</th>
                <th data-options="field:'account_number',width:100,halign:'center'">Account No</th>
                <th data-options="field:'account_name',width:250,halign:'center'">Account Name</th>
                <th data-options="field:'description',width:150,halign:'center'">Description</th>
                <th data-options="field:'currency',width:80,align:'center'">Currency</th>
                <th data-options="field:'amount',width:100,halign:'center',align:'right',formatter:numberformatDefaultIdr">Amount</th>
                <th data-options="field:'adjustment',width:100,halign:'center',align:'right',formatter:numberformatDefaultIdr">Residual Value</th>
                <th data-options="field:'balance',width:100,halign:'center',align:'right',formatter:numberformatDefaultIdr">Balance</th>
            </tr>
        </thead>
    </table>

    <div style="width: 60%; float: left; margin-top:20px;">
        <br>
        <table id="dg5" title="Journal Postings" class="easyui-datagrid" style="width:100%;" showFooter="true">
            <thead>
                <tr>
                    <th data-options="field:'account_number',width:100,halign:'center'">Account No</th>
                    <th data-options="field:'account_name',width:200,halign:'center'">Account Name</th>
                    <th data-options="field:'description',width:250,halign:'center'">Description</th>
                    <th data-options="field:'local_debit',width:100,halign:'center',align:'right',formatter:numberformatDefaultIdr">Debit</th>
                    <th data-options="field:'local_credit',width:100,halign:'center',align:'right',formatter:numberformatDefaultIdr">Credit</th>
                </tr>
            </thead>
        </table>
    </div>
</div>

<!-- PDF -->
<iframe id="printout" src="<?= base_url('finance/journal_posting_clearing/print') ?>" style="width: 100%;" hidden></iframe>
<script>

    //Add Data
    function add() {
        $('#dlg_insert').dialog('open');
        $("#fieldset").show();
        $('#dg2').datagrid('loadData', []);
        $('#frm_insert').form('clear');

        proses = "ADD";

        $("#journal_date").datebox('enable');
        $("#modul").textbox('enable');
        $("#journal_type").combobox('enable');
        $("#company_id").combogrid('enable');
        $("#document_no").combogrid('enable');
        $("#number").textbox('enable');
        
        $("#modul").textbox('setValue', "CLEARING");
        $("#journal_date").datebox('setValue', "<?= date("Y-m-d") ?>");

        $('#dg2').datagrid({
            onBeforeEdit: function(index, row) {
                row.editing = true;
                $(this).datagrid('refreshRow', index);
            },
            onAfterEdit: function(index, row) {
                row.editing = false;
                $(this).datagrid('refreshRow', index);
            },
            onCancelEdit: function(index, row) {
                row.editing = false;
                $(this).datagrid('refreshRow', index);
            },
        });
    }

    //NOMOR AUTOMATIC
    function number(id_menu) {
        $.ajax({
            type: "post",
            url: "<?= base_url('finance/journal_posting_clearing/number/') ?>" + id_menu,
            dataType: "html",
            success: function(result) {
                if(result == ""){
                    toastr.info("Please Check Configuration in Serial No First");
                }else{
                    $("#number").textbox('setValue', result);
                }
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

    function onClickCell(index, field) {
        var modul = $("#modul").textbox('getValue');

        if(modul == "ADJUSTMENT"){
            if (editIndex != index) {
                if (endEditing()) {
                    $('#dg2').datagrid('selectRow', index).datagrid('beginEdit', index);
                    editIndex = index;
                } else {
                    setTimeout(function() {
                        $('#dg2').datagrid('selectRow', editIndex);
                    }, 0);
                }
            }
        }else{
            toastr.warning("Not Available for Modul " + modul);
        }
    }

    function removebtn(value, row, index) {
        if (row.editing) {
            var s = '<a href="javascript:void(0)" class="btn btn-success btn-sm w-100" style="pointer-events:auto; opacity:1;" onclick="saverow(this)">Save</a> ';
            return s;
        } else {
            if(row.currency != "TOTAL"){
                var e = '<a href="javascript:void(0)" class="btn btn-primary btn-sm w-100" style="pointer-events:auto; opacity:1;" onclick="editrow(this)">Edit</a> ';

                return e;
            }
        }
    }

    function getRowIndex(target) {
        var tr = $(target).closest('tr.datagrid-row');
        return parseInt(tr.attr('datagrid-row-index'));
    }

    function editrow(target) {
        if (editIndex !== undefined) {
            $('#dg2').datagrid('endEdit', editIndex);
        }

        var rowIndex = getRowIndex(target);
        $('#dg2').datagrid('selectRow', rowIndex).datagrid('beginEdit', rowIndex);
        editIndex = rowIndex;
    }

    function saverow(target) {
        $('#dg2').datagrid('endEdit', getRowIndex(target));

        $('#dg2').datagrid('acceptChanges');
        var rows = $('#dg2').datagrid('getRows');
        var totalrows = rows.length;
        endEditing();
        var jsonData = JSON.stringify(rows);

        $.ajax({
            type: "POST",
            url: "<?= base_url('finance/journal_posting_clearing/createJson') ?>",
            data: {
                jsonData: jsonData,
            },
            success: function(response) {
                $('#dg2').datagrid({
                    url: '<?= base_url('finance/journal_posting_clearing/calculates') ?>',
                    pagination: false,
                    rownumbers: true,
                });
            },
        });
    }

    //EDIT DATA
    function update() {
        toastr.info("Not Yet Available");
        // var row = $('#dg').datagrid('getSelected');
        // if (row) {
        //     // toastr.warning("Not Available");
        //     $('#dlg_insert').dialog('open');
        //     $('#frm_insert').form('load', row);
            
        //     proses = "UPDATE";

        //     $("#journal_date").datebox('disable');
        //     $("#modul").textbox('disable');
        //     $("#journal_type").combobox('disable');
        //     $("#company_id").combogrid('disable');
        //     $("#document_no").combogrid('disable');
        //     $("#number").textbox('disable');

        //     setTimeout(function() {
        //         $("#number").textbox('setValue', row.number);
        //         $("#modul").textbox('setValue', row.modul);
        //     }, 2000);


        //     var lastIndex;
        //     $('#dg2').datagrid({
        //         url: '<?= base_url('finance/journal_posting_clearing/datatableUpdates') ?>?number=' + window.btoa(row.number),
        //         // onLoadSuccess: function(data){
        //         //     $("#local_debit").numberbox('setValue', data['footer'][0].local_debit);
        //         //     $("#local_credit").numberbox('setValue', data['footer'][0].local_credit);
        //         // },
        //         onBeforeEdit: function(index, row) {
        //             row.editing = true;
        //             $(this).datagrid('refreshRow', index);
        //         },
        //         onAfterEdit: function(index, row) {
        //             row.editing = false;
        //             $(this).datagrid('refreshRow', index);
        //         },
        //         onCancelEdit: function(index, row) {
        //             row.editing = false;
        //             $(this).datagrid('refreshRow', index);
        //         },
        //     });

        // } else {
        //     toastr.warning("Please select one of the data in the table first!", "Information");
        // }
    }

    //DELETE DATA
    function deleted() {
        var rows = $('#dg').datagrid('getSelections');
        if (rows.length > 0) {
            $.messager.confirm('Warning', 'Are you sure you want to delete this data?', function(r) {
                if (r) {
                    for (var i = 0; i < rows.length; i++) {
                        var row = rows[i];

                        $.ajax({
                            type: "post",
                            url: "<?= base_url('closing/locks/checkLock') ?>",
                            data: "period=" + row.journal_date + "&menus_id=<?= $menus_id ?>",
                            dataType: "json",
                            success: function (lock) {
                                if(lock.total > 0){
                                    toastr.error("This period is not active by Accounting");
                                    return false;
                                }

                                $.ajax({
                                    method: 'post',
                                    url: '<?= base_url('finance/journal_posting_clearing/delete') ?>',
                                    data: {
                                        number: row.number
                                    },
                                    success: function(result) {
                                        var result = eval('(' + result + ')');
                                    },
                                    error: function(jqXHR, textStatus, errorThrown) {
                                        toastr.error("This data is already used in other modules, You must delete it First", "Error");
                                        
                                    },
                                    complete: function(data) {
                                        $('#dg').datagrid('reload');
                                    }
                                });
                            }
                        });
                    }
                }
            });
        } else {
            toastr.warning("Please select one of the data in the table first!", "Information");
        }
    }

    function preview() {
        var rows = $('#dg2').datagrid('getRows');
        var totalrows = rows.length;
        endEditing();

        var journal_type = $("#journal_type").combobox('getValue');

        if (totalrows > 0) {
            var jsonData = JSON.stringify(rows);

            $.ajax({
                type: "POST",
                url: "<?= base_url('finance/journal_posting_clearing/createJson') ?>",
                data: {
                    jsonData: jsonData,
                },
                success: function(response) {
                    $('#dg4').datagrid({
                        url: '<?= base_url('finance/journal_posting_clearing/calculateJournal/') ?>' + btoa(journal_type),
                        pagination: false,
                        rownumbers: true,
                    });
                },
            });
        } else {
            toastr.warning("No Data to Preview");
        }
    }

    function previewData(){
        var journal_date = $("#journal_date").datebox('getValue');
        var company_id = $("#company_id").combogrid('getValue');
        var document_no = $("#document_no").combogrid('getText');

        if (document_no == "" || company_id == "") {
            toastr.info('Please Choose Document No and Company Name');
        } else {
            $('#dg2').datagrid({
                url: '<?= base_url('finance/journal_posting_clearing/datatablesTemp') ?>?journal_date=' + window.btoa(journal_date) + "&document_no=" + window.btoa(document_no) + "&company_id=" + window.btoa(company_id),
            });
        }
    }

    //FILTER DATA
    function filter() {
        var filter_from = $("#filter_from").datebox('getValue');
        var filter_to = $("#filter_to").datebox('getValue');
        var filter_journal_type_id = $("#filter_journal_type_id").combogrid('getValue');
        var filter_voucher = $("#filter_voucher").textbox('getValue');
        var filter_company = $("#filter_company").combogrid('getValue');

        var url = "?filter_from=" + window.btoa(filter_from) +
            "&filter_to=" + window.btoa(filter_to) +
            "&filter_journal_type_id=" + window.btoa(filter_journal_type_id) +
            "&filter_company=" + window.btoa(filter_company) +
            "&filter_voucher=" + window.btoa(filter_voucher);

        $('#dg').datagrid({
            url: '<?= base_url('finance/journal_posting_clearing/datatables') ?>' + url,
            pagination: true,
            rownumbers: true,
            fit:true,
        });

        $("#printout").contents().find('html').html("<center><br><br><br><b style='font-size:20px;'>Please Wait...</b></center>");
        $("#printout").attr('src', '<?= base_url('finance/journal_posting_clearing/print') ?>' + url);
    }

    //PRINT PDF
    function pdf() {
        $("#printout").get(0).contentWindow.print();
    }

    //PRINT EXCEL
    function excel() {
        var filter_from = $("#filter_from").datebox('getValue');
        var filter_to = $("#filter_to").datebox('getValue');
        var filter_journal_type_id = $("#filter_journal_type_id").combogrid('getValue');
        var filter_voucher = $("#filter_voucher").textbox('getValue');
        var filter_company = $("#filter_company").combogrid('getValue');

        var url = "?filter_from=" + window.btoa(filter_from) +
            "&filter_to=" + window.btoa(filter_to) +
            "&filter_journal_type_id=" + window.btoa(filter_journal_type_id) +
            "&filter_company=" + window.btoa(filter_company) +
            "&filter_voucher=" + window.btoa(filter_voucher);

        window.location.assign('<?= base_url('finance/journal_posting_clearing/print/excel') ?>' + url);
    }

    function print_voucher() {
        var row = $('#dg').datagrid('getSelected');

        if (row) {
            window.open("<?= base_url('finance/journal_posting_clearing/print_voucher/') ?>" + window.btoa(row.number), "_blank", 'location=yes,height=600,width=1200,scrollbars=yes,status=yes');
        } else {
            toastr.warning("Please select GL No in the table first!");
        }
    }

    //RELOAD
    function reload() {
        window.location.reload();
    }

    function updateTotal() {
        var rows = $('#document_no').combogrid('grid').datagrid('getSelections');
        var total = 0;
        for (var i = 0; i < rows.length; i++) {
            total += parseFloat(rows[i].amount);
        }
        $('#total_amount').numberbox('setValue', total.toFixed(2));
    }

    $(function() {
        filter();

        //SAVE DATA
        $('#dlg_insert').dialog({
            buttons: [{
                text: 'Save All',
                iconCls: 'icon-ok',
                handler: function() {
                    var btn = $(this);
                    btn.linkbutton('disable');
                    setTimeout(function() { 
                        btn.linkbutton('enable'); 
                    }, 3000);
                    
                    var journal_date = $("#journal_date").datebox('getValue');
                    var modul = $("#modul").textbox('getValue');
                    var journal_type = $("#journal_type").combobox('getValue');
                    var number = $("#number").textbox('getValue');
                    var remarks = $("#remarks").textbox('getValue');

                    // var local_debit = $("#local_debit").numberbox('getValue');
                    // var local_credit = $("#local_credit").numberbox('getValue');

                    endEditing();
                    //var rows = $('#dg2').datagrid('getSelections');
                    var rows = $('#dg2').datagrid('getRows');
                    var totalrows = rows.length;

                    var rows2 = $('#dg4').datagrid('getRows');
                    var totalrows2 = rows2.length;

                    total_local_debit = 0;
                    total_local_credit = 0;
                    for (let i = 0; i < totalrows2; i++) {
                        var data = rows2[i];
                        total_local_debit += data.local_debit;
                        total_local_credit += data.local_credit;
                    }

                    if(parseFloat(total_local_debit).toFixed(2) != parseFloat(total_local_credit).toFixed(2)){
                        toastr.error("Journal Not Balance " + parseFloat(total_local_debit).toFixed(2) + " != " + parseFloat(total_local_credit).toFixed(2));
                        return false;
                    }

                    if(totalrows2 == 0){
                        toastr.error("Calculate to Journal still empty!");
                        return false;
                    }

                    $.ajax({
                        type: "post",
                        url: "<?= base_url('closing/locks/checkLock') ?>",
                        data: "period=" + journal_date + "&menus_id=<?= $menus_id ?>",
                        dataType: "json",
                        success: function (lock) {
                            if(lock.total > 0){
                                toastr.error("This period is not active by Accounting");
                                return false;
                            }

                            if (rows.length > 0) {
                                $.messager.confirm('Warning', 'Are you sure you want to save this data?', function(r) {
                                    if (r) {
                                        Swal.fire({
                                            title: 'Please Wait for Saving Data',
                                            showConfirmButton: false,
                                            allowOutsideClick: false,
                                            allowEscapeKey: false,
                                            didOpen: () => {
                                                Swal.showLoading();
                                            },
                                        });

                                        $.ajax({
                                            type: "post",
                                            url: "<?= base_url('finance/journal_posting_clearing/number/' . $menus_id) ?>",
                                            dataType: "html",
                                            success: function(numberValue) {
                                                if(numberValue == ""){
                                                    Swal.close();
                                                    toastr.info("Please Check Configuration in Serial No First");
                                                    return false;
                                                }

                                                requestData(totalrows, rows);
                                                $('#dlg_insert').dialog('close');

                                                function requestData(total, json, jml = 1, value = 0) {
                                                    if (value < 100) {
                                                        value = Math.floor((jml / total) * 100);
                                                        var i = (jml - 1);

                                                        $('#p_upload').progressbar('setValue', value);
                                                        $('#p_start').html(jml);
                                                        $('#p_finish').html(totalrows);

                                                        $.ajax({
                                                            type: "post",
                                                            url: '<?= base_url('finance/journal_posting_clearing/create') ?>',
                                                            data: {
                                                                journal_date: journal_date,
                                                                journal_type_id: json[i].journal_type_id,
                                                                document_no: json[i].document_no,
                                                                document_date: json[i].document_date,
                                                                invoice_no: json[i].invoice_no,
                                                                invoice_date: json[i].invoice_date,
                                                                number: numberValue,
                                                                company_id: json[i].company_id,
                                                                company_name: json[i].company_name,
                                                                trans_date: journal_date,
                                                                description: json[i].description,
                                                                account_number: json[i].account_number,
                                                                account_name: json[i].account_name,
                                                                currency: json[i].currency,
                                                                remarks: remarks,
                                                                source: json[i].source,
                                                                amount: json[i].amount,
                                                                adjustment: json[i].adjustment,
                                                                balance: json[i].balance,
                                                            },
                                                            dataType: "json",
                                                            success: function(result) {
                                                                requestData(total, json, jml + 1, value);
                                                                
                                                                if (jml == total) {
                                                                    if (totalrows2 > 0) {
                                                                        requestData2(totalrows2, rows2);
                                                                        
                                                                        function requestData2(total2, json2, jml2 = 1, value2 = 0) {
                                                                            if (value2 < 100) {
                                                                                value2 = Math.floor((jml2 / total2) * 100);
                                                                                var z = (jml2 - 1);

                                                                                $.ajax({
                                                                                    type: "post",
                                                                                    url: '<?= base_url('finance/journal_posting_clearing/createJournals') ?>',
                                                                                    data: {
                                                                                        number: number,
                                                                                        journal_date: journal_date,
                                                                                        journal_type_id: "20241120000002",
                                                                                        modul: modul,
                                                                                        journal_type: journal_type,
                                                                                        number: numberValue,
                                                                                        remarks: remarks,
                                                                                        company_id: json[0].company_id,
                                                                                        company_name: json[0].company_name,
                                                                                        account_number: json2[z].account_number,
                                                                                        account_name: json2[z].account_name,
                                                                                        description: json2[z].description,
                                                                                        currency: "INR",
                                                                                        original_debit: json2[z].local_debit,
                                                                                        original_credit: json2[z].local_credit,
                                                                                        rates: 1,
                                                                                        local_debit: json2[z].local_debit,
                                                                                        local_credit: json2[z].local_credit,
                                                                                        status_cl: json2[z].status_cl,
                                                                                    },
                                                                                    dataType: "json",
                                                                                    success: function(result2) {
                                                                                        requestData2(total2, json2, jml2 + 1, value2);
                                                                                        if (jml2 == total2) {
                                                                                            Swal.close();

                                                                                            Swal.fire({
                                                                                                title: result2.message,
                                                                                                icon: result2.theme,
                                                                                                confirmButtonText: 'Ok',
                                                                                                allowOutsideClick: false,
                                                                                            }).then((result2) => {
                                                                                                if (result2.isConfirmed) {
                                                                                                    window.location.reload();
                                                                                                }
                                                                                            });
                                                                                        }
                                                                                    }
                                                                                });
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        });
                                                    }
                                                }
                                            }
                                        });
                                    }
                                });
                            } else {
                                toastr.info("Please Checklist Posting");
                            }
                        }
                    });
                }
            }]
        });

        $("#filter_company").combogrid({
            url: '<?= base_url('finance/journal_posting_clearing/readCompany2') ?>',
            panelWidth: 480,
            idField: 'id',
            textField: 'name',
            mode: 'remote',
            fitColumns: true,
            prompt: "Choose Company Name",
            icons: [{
                iconCls: 'icon-clear',
                handler: function(e) {
                    $(e.data.target).combogrid('clear').combogrid('textbox').focus();
                }
            }],
            columns: [
                [{
                    field: 'id',
                    title: 'Code',
                    width: 100
                }, {
                    field: 'name',
                    title: 'Name',
                    width: 250
                }, {
                    field: 'plant',
                    title: 'Plant',
                    width: 120
                }]
            ],
        });

        $("#filter_journal_type_id").combogrid({
            url: '<?= base_url('finance/journal_posting_clearing/readJournalType') ?>',
            panelWidth: 360,
            idField: 'id',
            textField: 'name',
            mode: 'remote',
            fitColumns: true,
            prompt: "Choose Journal Type",
            columns: [
                [{
                    field: 'number',
                    title: 'Code',
                    width: 100
                }, {
                    field: 'name',
                    title: 'Name',
                    width: 250
                }]
            ],
            icons: [{
                iconCls: 'icon-clear',
                handler: function(e) {
                    $(e.data.target).combogrid('clear').combogrid('textbox').focus();
                }
            }],
        });

        $("#journal_type").combobox({
            onChange: function(val){
                if(val == ""){
                    return false;
                }

                $("#company_id").combogrid({
                    url: '<?= base_url('finance/journal_posting_clearing/readCompany/') ?>' + btoa(val),
                    panelWidth: 480,
                    idField: 'id',
                    textField: 'name',
                    mode: 'remote',
                    fitColumns: true,
                    prompt: "Choose Company Name",
                    columns: [
                        [{
                            field: 'id',
                            title: 'Code',
                            width: 100
                        }, {
                            field: 'name',
                            title: 'Name',
                            width: 250
                        }, {
                            field: 'plant',
                            title: 'Plant',
                            width: 120
                        }]
                    ],
                    onSelect: function(valSup, rowSup){
                        $("#document_no").combogrid({
                            url: '<?= base_url('finance/journal_posting_clearing/readDocuments/') ?>' + btoa(rowSup.id),
                            panelWidth: 850,
                            idField: 'documents',
                            textField: 'documents',
                            mode: 'remote',
                            fitColumns: true,
                            multiple: true,
                            toolbar: "#toolbarDocumentNo",
                            prompt: "Choose Document No",
                            columns: [
                                [{
                                    field:'ck',
                                    checkbox:true
                                },{
                                    field: 'source',
                                    title: 'Type',
                                    align: 'center',
                                    width: 50
                                },{
                                    field: 'documents',
                                    title: 'Document No',
                                    width: 150,
                                    hidden: true
                                },{
                                    field: 'document_no',
                                    title: 'Document No',
                                    width: 150
                                },{
                                    field: 'invoice_no',
                                    title: 'Invoice No',
                                    width: 200
                                }, {
                                    field: 'voucher_no',
                                    title: 'Voucher No',
                                    width: 130
                                }, {
                                    field: 'account_number',
                                    title: 'Account No',
                                    width: 100
                                }, {
                                    field: 'currency',
                                    title: 'Currency',
                                    align: 'center',
                                    width: 80
                                }, {
                                    field: 'amount',
                                    title: 'Amount',
                                    width: 100,
                                    halign: 'center',
                                    align: 'right',
                                    formatter: numberformatDefaultIdr
                                }]
                            ],
                            onCheck: updateTotal,
                            onUncheck: updateTotal,
                            onCheckAll: updateTotal,
                            onUncheckAll: updateTotal
                        });
                    }
                });
            }
        });

        $("#journal_date").datebox({
            onChange: function(val) {
                number("<?= $menus_id ?>");
            }
        });
    });

    function btnDetails(val, row) {
        var details = "viewDetails('" + row.number + "')";
        return '<a class="btn btn-primary w-100" onClick="' + details + '" style="pointer-events: visible; opacity:1;"><i class="fa fa-eye"></i> View</a>';
    }

    function viewDetails(number) {
        $("#dlg_detail").window('open');
        $("#dlg_detail").window('setTitle', "Detail of " + number);

        $('#dg3').datagrid({
            url: '<?= base_url('finance/journal_posting_clearing/datatableDetails?number=') ?>' + btoa(number),
            pagination: false,
            rownumbers: true,
            remoteFilter: true,
        });

        $('#dg5').datagrid({
            url: '<?= base_url('finance/journal_posting_clearing/datatableDetailJournals?number=') ?>' + btoa(number),
            pagination: false,
            rownumbers: true,
            remoteFilter: true,
        });
    }

    function myformatter(date) {
        var y = date.getFullYear();
        var m = date.getMonth() + 1;
        var d = date.getDate();
        return y + '-' + (m < 10 ? ('0' + m) : m) + '-' + (d < 10 ? ('0' + d) : d);
    }

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

    function numberformatDefault(value, row) {
        if (value != null) {
            const formatter = new Intl.NumberFormat('ja-JP', {
                minimumFractionDigits: 2
            });
            return "<b>" + formatter.format(value) + "</b>";
        }
    }

    function numberformatDefaultIdr(value, row){
        if (value != null) {
            const formatter = new Intl.NumberFormat('ja-JP', {
                minimumFractionDigits: 2
            });
            return "<b>" + formatter.format(value) + "</b>";
        }
    }

    function approvedFormat(value, row) {
        if (row.approved_to == "" || row.approved_to == null) {
            return "<b style='color:green;'>APPROVED</b>";
        } else {
            return "<b style='color:red;'>CHECKING</b>";
        }
    }

    function approvedStyle(value, row, index) {
        if (row.approved_to == "" || row.approved_to == null) {
            return 'background-color:#C8FFCC;';
        } else {
            return 'background-color:#FFC8C8;';
        }
    }
</script>