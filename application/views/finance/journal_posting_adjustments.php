<table id="dg" class="easyui-datagrid" style="width:100%;" toolbar="#toolbar">
    <thead>
        <tr>
            <th rowspan="2" field="ck" checkbox="true"></th>
            <th rowspan="2" data-options="field:'details',width:90,align:'center', formatter:btnDetails">Detail</th>
            <th rowspan="2" data-options="field:'journal_date',width:100,align:'center'">Posting Date</th>
            <th rowspan="2" data-options="field:'number',width:140,align:'center'">Voucher No</th>
            <!-- <th rowspan="2" data-options="field:'journal_type_name',width:100,halign:'center'">Journal Type</th> -->
            <th rowspan="2" data-options="field:'document_no',width:200,halign:'center'">Invoice No</th>
            <th rowspan="2" data-options="field:'trans_date',width:120,halign:'center'">Invoice Date</th>
            <!-- <th rowspan="2" data-options="field:'modul',width:150,halign:'center'">Modul</th> -->
            <th rowspan="2" data-options="field:'tds',width:100,halign:'center'">TDS</th>
            <th colspan="3" data-options="field:'',width:200,halign:'center'">Original Currency</th>
            <th colspan="3" data-options="field:'',width:200,halign:'center'">Local Currency</th>
            <th rowspan="2" data-options="field:'remarks',width:200,halign:'center'">Remarks</th>
            <th colspan="3" data-options="field:'',width:100,halign:'center'"> Approval</th>
            <th colspan="2" data-options="field:'',width:100,halign:'center'"> Created</th>
            <th colspan="2" data-options="field:'',width:100,halign:'center'"> Updated</th>
        </tr>
        <tr>
            <th data-options="field:'currency',width:80,align:'center'">Currency</th>
            <th data-options="field:'original_debit',width:100,halign:'center',align:'right',formatter:numberformatDefault">Debit</th>
            <th data-options="field:'original_credit',width:100,halign:'center',align:'right',formatter:numberformatDefault">Credit</th>
            <th data-options="field:'rates',width:80,halign:'center',align:'right',formatter:numberformatDefault">Rates</th>
            <th data-options="field:'local_debit',width:100,halign:'center',align:'right',formatter:numberformatDefault">Debit</th>
            <th data-options="field:'local_credit',width:100,halign:'center',align:'right',formatter:numberformatDefault">Credit</th>
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
                    <input style="width:60%;" id="filter_journal_type" class="easyui-combogrid">
                </div>
                <div class="fitem">
                    <span style="width:35%; display:inline-block;"></span>
                    <a href="javascript:;" class="easyui-linkbutton" onclick="filter()"><i class="fa fa-search"></i> Filter Data</a>
                    <a href="javascript:;" class="easyui-linkbutton" onclick="print_voucher()"><i class="fa fa-print"></i> Print Voucher</a>
                </div>
            </div>
            <div style="width:50%; float:left;">
                <div class="fitem">
                    <span style="width:35%; display:inline-block;">Voucher No</span>
                    <input style="width:60%;" id="filter_voucher" class="easyui-textbox" />
                </div>
            </div>
        </fieldset>
        <?= $button ?>
        <a href="javascript:void(0)" class="easyui-linkbutton" id="reverse" data-options="plain:true" onclick="reverse()"><i class="fa fa-rotate-left"></i> Reversal</a>
    </div>
</div>

<div id="toolbar2">
    <a href="javascript:void(0)" class="easyui-linkbutton" id="append" data-options="plain:true" onclick="append()"><i class="fa fa-plus"></i> Add</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" id="preview" data-options="plain:true" onclick="preview()"><i class="fa fa-eye"></i> Preview Journal</a>
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
                <div class="fitem" hidden>
                    <span style="width:35%; display:inline-block;">Modul</span>
                    <input style="width:60%;" name="modul" id="modul" class="easyui-textbox" required>
                </div>
                <div class="fitem" hidden>
                    <span style="width:35%; display:inline-block;">Journal Type</span>
                    <input style="width:60%;" name="journal_type_id" id="journal_type" class="easyui-combogrid" required>
                </div>
                <div class="fitem">
                    <span style="width:35%; display:inline-block;">Journal Category</span>
                    <select style="width:60%;" name="journal_category" id="journal_category" class="easyui-combobox" panelHeight="auto">
                        <option value="GL - GL">GL - GL</option>
                        <option value="GL - SUPPLIER">GL - SUPPLIER</option>
                        <option value="GL - CUSTOMER">GL - CUSTOMER</option>
                        <option value="GL - BANK">GL - BANK</option>
                        <option value="GL - ASSET">GL - ASSET</option>
                    </select>
                </div>
                <div class="fitem">
                    <span style="width:35%; display:inline-block;">Vourcher No</span>
                    <input style="width:60%;" name="number" id="number" readonly class="easyui-textbox">
                </div>
            </div>
            <div style="width:30%; float:left;">
                <div class="fitem">
                    <span style="width:35%; display:inline-block;">Invoice Date</span>
                    <input style="width:60%;" name="document_date" id="document_date" required="" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser, editable:false">
                </div>
                <div class="fitem">
                    <span style="width:35%; display:inline-block;">Invoice No</span>
                    <input style="width:60%;" name="document_no" required id="document_no" class="easyui-textbox">
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
                    <th data-options="field:'remove',width:120, formatter:removebtn">Action</th>
                    <th hidden data-options="field:'flag',width:100,editor: {type: 'textbox'}">Flag</th>
                    <th hidden data-options="field:'id',width:150,editor: {type: 'textbox'}">ID</th>
                    <!-- <th data-options="field:'document_no',width:120, editor: {
                        type: 'combobox',
                        options: {
                            data: [
                                {name: 'GL - GL'},
                                {name: 'GL - SUPPLIER'},
                                {name: 'GL - CUSTOMER'},
                                {name: 'GL - BANK'},
                            ],
                            panelHeight: 'auto',
                            valueField: 'name',
                            textField: 'name',
                            prompt: 'Choose Reference',
                            onSelect: function(reff) {
                                
                            }
                        }}">Reference</th> -->
                    <th data-options="field:'description',width:200,editor: {type: 'textbox', options: {required: true}}">Description</th>
                    <th data-options="field:'account_number',width:100, halign:'center', editor: {type: 'combogrid'}">Account No</th>
                    <th data-options="field:'account_name',width:180, editor: {type: 'textbox', options: {readonly: true}}">Account Name</th>
                    <th hidden data-options="field:'company_id',width:100,editor: {type: 'textbox', options: {readonly: true}}">Code</th>
                    <th hidden data-options="field:'company_name',width:200,editor: {type: 'textbox', options: {readonly: true}}">Name</th>
                    <th data-options="field:'currency',width:80,editor: {type: 'textbox', options: {required: true, readonly: true}}">Currency</th>
                    <th data-options="field:'amount',width:100,halign:'center',align:'right',formatter:numberformatDefaultIdr,editor: {type: 'numberbox', options: {required: true, precision:2}}">Taxable<br>Amount</th>
                    <th data-options="field:'taxes',width:100, halign:'center', editor: {type: 'combogrid', options: {
                            url: '<?= base_url("finance/taxes/reads");  ?>',
                            panelWidth: 350,
                            panelHeight: 200,
                            idField: 'number',
                            textField: 'name',
                            mode: 'remote', 
                            fitColumns: true,
                            prompt: 'Choose GST Conditions',
                            columns: [
                                [{
                                    field: 'number',
                                    title: 'Code',
                                    width: 100
                                }, {
                                    field: 'name',
                                    title: 'Name',
                                    width: 200
                                }]
                            ],
                            onSelect: function(value, rows) {
                                var dg = $('#dg2');
                                var row = dg.datagrid('getSelected');
                                var rowIndex = dg.datagrid('getRowIndex', row);
                                var ed = dg.datagrid('getEditor', {
                                    index: rowIndex,
                                    field: 'amount'
                                });
                                var ed2 = dg.datagrid('getEditor', {
                                    index: rowIndex,
                                    field: 'taxes'
                                });
                                var ed3 = dg.datagrid('getEditor', {
                                    index: rowIndex,
                                    field: 'taxes_amount'
                                });
                                var ed4 = dg.datagrid('getEditor', {
                                    index: rowIndex,
                                    field: 'debitcredit'
                                });

                                var amount = $(ed.target).numberbox('getValue');

                                if(amount > 0){
                                    $(ed3.target).numberbox('setValue', (parseFloat(amount) * ((parseFloat(rows.cgst2) + parseFloat(rows.sgst2) + parseFloat(rows.igst2)) / 100)));
                                    $(ed4.target).combobox('clear');
                                }else{
                                    toastr.error('Amount Still Empty');
                                    $(ed2.target).combogrid('clear');
                                    $(ed3.target).numberbox('clear');
                                }
                            }
                        }
                    }">GST<br>Conditions</th>
                    <th data-options="field:'taxes_amount',width:100, halign:'center', editor: {type: 'numberbox', options: {precision: 2, readonly: true}}">GST Amount</th>
                    <th data-options="field:'debitcredit',width:100,editor: {type: 'combobox',
                        options: {
                            data: [
                                {name: 'DEBIT'},
                                {name: 'CREDIT'},
                            ],
                            required: true,
                            panelHeight: 'auto',
                            valueField: 'name',
                            textField: 'name',
                            prompt: 'Choose Debit/Credit',
                            onSelect: function(db) {
                                var dg = $('#dg2');
                                var row = dg.datagrid('getSelected');
                                var rowIndex = dg.datagrid('getRowIndex', row);

                                var ed = dg.datagrid('getEditor', {
                                    index: rowIndex,
                                    field: 'amount'
                                });

                                var ed1 = dg.datagrid('getEditor', {
                                    index: rowIndex,
                                    field: 'local_debit'
                                });

                                var ed2 = dg.datagrid('getEditor', {
                                    index: rowIndex,
                                    field: 'local_credit'
                                });

                                var ed4 = dg.datagrid('getEditor', {
                                    index: rowIndex,
                                    field: 'debitcredit'
                                });

                                var ed5 = dg.datagrid('getEditor', {
                                    index: rowIndex,
                                    field: 'taxes_amount'
                                });

                                var amount = $(ed.target).numberbox('getValue');
                                var taxes_amount = $(ed5.target).numberbox('getValue');
                                if(amount == '' && taxes_amount == ''){
                                    toastr.error('Please Complete the amount');
                                    $(ed4.target).combobox('clear');
                                }else if(db.name == 'DEBIT'){
                                    $(ed1.target).numberbox('setValue', (parseFloat(amount) + parseFloat(taxes_amount)));
                                    $(ed2.target).numberbox('setValue', 0);
                                }else if(db.name == 'CREDIT'){
                                    $(ed1.target).numberbox('setValue', 0);
                                    $(ed2.target).numberbox('setValue', (parseFloat(amount) + parseFloat(taxes_amount)));
                                }else{
                                    $(ed4.target).combobox('clear');
                                }
                            }
                        }}">Debit / Credit</th>
                    <th data-options="field:'local_debit',width:100,halign:'center',align:'right',formatter:numberformatDefaultIdr,editor: {type: 'numberbox', options: {readonly: true, precision:2}}">Debit</th>
                    <th data-options="field:'local_credit',width:100,halign:'center',align:'right',formatter:numberformatDefaultIdr,editor: {type: 'numberbox', options: {readonly: true, precision:2}}">Credit</th>
                </tr>
            </thead>
        </table>
    </form>
</div>

<div id="dlg_detail" class="easyui-window" title="Journal Detail" data-options="closed: true,modal:true" style="width: 1200px; height: 500px; top: 20px; left:10px;">
    <table id="dg3" class="easyui-datagrid" style="width:100%;" showFooter="true">
        <thead>
            <tr>
                <th data-options="field:'journal_date',width:100,halign:'center'">Posting Date</th>
                <th data-options="field:'trans_date',width:120,halign:'center'">Invoice Date</th>
                <th data-options="field:'document_no',width:220,halign:'center'">Invoice No</th>
                <!-- <th data-options="field:'invoice_no',width:150,halign:'center'">Supplier Invoice</th> -->
                <th data-options="field:'company_name',width:200,halign:'center'">Company Name</th>
                <th data-options="field:'account_number',width:100,halign:'center'">Account No</th>
                <th data-options="field:'account_name',width:250,halign:'center'">Account Name</th>
                <th data-options="field:'description',width:150,halign:'center'">Description</th>
                <th data-options="field:'currency',width:80,align:'center'">Currency</th>
                <th data-options="field:'local_debit',width:100,halign:'center',align:'right',formatter:numberformatDefaultIdr">Debit</th>
                <th data-options="field:'local_credit',width:100,halign:'center',align:'right',formatter:numberformatDefaultIdr">Credit</th>
            </tr>
        </thead>
    </table>
</div>

<div id="dlg_journal" class="easyui-dialog" title="Preview Journal" data-options="closed: true,modal:true" style="width: 650px; top:20px;">
    <table id="dg4" class="easyui-datagrid" style="width:100%;" showFooter="true">
        <thead>
            <tr>
                <th data-options="field:'account_number',width:100,halign:'center'">Account No</th>
                <th data-options="field:'account_name',width:250,halign:'center'">Account Name</th>
                <th data-options="field:'local_debit',width:100,halign:'center',align:'right',formatter:numberformatDefaultIdr">Debit</th>
                <th data-options="field:'local_credit',width:100,halign:'center',align:'right',formatter:numberformatDefaultIdr">Credit</th>
            </tr>
        </thead>
    </table>
</div>

<div id="dlg_generate" class="easyui-dialog" title="Save Data" data-options="closed: true,modal:true,closable: false" style="width: 500px; padding:10px; top: 20px;">
    <div class="alert alert-warning" role="alert">
        Please wait until the save process is complete
    </div>
    <div id="p_upload" class="easyui-progressbar" style="width:460px; margin-top: 10px;"></div>
    <center><b id="p_start">0</b> Of <b id="p_finish">0</b></center>
    <div id="p_remarks" class="easyui-panel" style="width:460px; height:200px; padding:10px; margin-top: 10px;">
        <p>History Save Data</p>
        <ul id="remarks">

        </ul>
    </div>
</div>

<!-- UPLOAD DATA -->
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
    <span style="float: left; color:green;">SUCCESS : <b id="p_success2">0</b></span><span style="float: right; color:red;"> FAILED : <b id="p_failed2">0</b></span>
    <div id="p_upload2" class="easyui-progressbar" style="width:100%; margin-top: 10px;"></div>
    <center><b id="p_start2">0</b> Of <b id="p_finish2">0</b></center>
    <div id="p_remarks2" title="History Upload" class="easyui-panel" style="width:100%; height:200px; padding:10px; margin-top: 10px;">
        <ul id="remarks">
        </ul>
    </div>
</div>

<!-- PDF -->
<iframe id="printout" src="<?= base_url('finance/journal_posting_adjustments/print') ?>" style="width: 100%;" hidden></iframe>
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
        $("#journal_type").combogrid('enable');
        $("#journal_category").combobox('enable');
        $("#document_no").textbox('enable');
        $("#number").textbox('enable');
        $("#append").linkbutton('enable');
        
        $("#modul").textbox('setValue', "ADJUSTMENT");
        $("#journal_date").datebox('setValue', "<?= date("Y-m-d") ?>");
        $("#journal_category").combobox('setValue', 'GL - GL');
        $("#journal_type").combogrid('setValue', '20241120000001');

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
            url: "<?= base_url('finance/journal_posting_adjustments/number/') ?>" + id_menu,
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

    function append() {
        var modul = $("#modul").textbox('getValue');
        var journal_date = $("#journal_date").datebox('getValue');
        var journal_category = $("#journal_category").combobox('getValue');
        var journal_type = $("#journal_type").combogrid('getValue');

        if(journal_type != ""){
            if (endEditing()) {
                var rows = $('#dg2').datagrid('getRows');
                var totalrows = rows.length;
                
                var amount = 0;
                var local_amount = 0;
                for (let i = 0; i < totalrows; i++) {
                    if(rows[i].debitcredit == "DEBIT"){
                        local_amount += parseFloat(rows[i].local_debit);
                    }else{
                        local_amount -= parseFloat(rows[i].local_credit);
                    }

                    amount += parseFloat(rows[i].amount);
                }

                if(local_amount > 0){
                    var debitcredit1 = "CREDIT";
                    var local_debit = 0;
                    var local_credit = local_amount;
                }else if(local_amount < 0){
                    var debitcredit1 = "DEBIT";
                    var local_debit = local_amount;
                    var local_credit = 0;
                }else{
                    var debitcredit1 = "";
                    var local_debit = 0;
                    var local_credit = 0;
                }

                $('#dg2').datagrid('appendRow', {
                    "flag": 1,
                    "currency": "INR",
                    "debitcredit": debitcredit1,
                    "amount": (local_debit + local_credit),
                    "taxes_amount": 0,
                    "local_debit": local_debit,
                    "local_credit": local_credit,
                });

                editIndex = $('#dg2').datagrid('getRows').length - 1;
                $('#dg2').datagrid('selectRow', editIndex).datagrid('beginEdit', editIndex);
                
                
                var ed = $('#dg2').datagrid('getEditor', {
                    index: editIndex,
                    field: 'account_number'
                });

                var urls = '<?= base_url('finance/journal_posting_adjustments/readCoa?category=') ?>' + btoa(journal_category);

                $(ed.target).combogrid({
                    url: urls,
                    panelWidth: 450,
                    panelHeight: 200,
                    idField: 'account_number',
                    textField: 'name',
                    mode: 'remote', 
                    fitColumns: true,
                    prompt: 'Choose Account No',
                    columns: [
                        [{
                            field: 'number',
                            title: 'Code',
                            width: 100
                        },{
                            field: 'name',
                            title: 'Name',
                            width: 250
                        }]
                    ],
                    onSelect: function(value, rows) {
                        var dg = $('#dg2');
                        var row = dg.datagrid('getSelected');
                        var rowIndex = dg.datagrid('getRowIndex', row);
                        var ed = dg.datagrid('getEditor', {
                            index: rowIndex,
                            field: 'account_name'
                        });
                        var ed1 = dg.datagrid('getEditor', {
                            index: rowIndex,
                            field: 'company_id'
                        });
                        var ed2 = dg.datagrid('getEditor', {
                            index: rowIndex,
                            field: 'company_name'
                        });
                        var ed3 = dg.datagrid('getEditor', {
                            index: rowIndex,
                            field: 'amount'
                        });
                        var ed4 = dg.datagrid('getEditor', {
                            index: rowIndex,
                            field: 'debitcredit'
                        });
                        var ed5 = dg.datagrid('getEditor', {
                            index: rowIndex,
                            field: 'local_credit'
                        });

                        $(ed.target).textbox('setValue', rows.account_name);
                        $(ed1.target).textbox('setValue', rows.number);
                        $(ed2.target).textbox('setValue', rows.name);

                        $.ajax({
                            type: "post",
                            url: "<?= base_url('master/tds/reads/') ?>" + rows.account_number,
                            dataType: "json",
                            success: function (tds) {
                                if(tds.length > 0){
                                    $(ed3.target).numberbox('setValue', (parseFloat(amount) * (parseFloat(tds[0].individual) / 100)));
                                    $(ed4.target).combobox('setValue', "CREDIT");
                                    $(ed5.target).numberbox('setValue', (parseFloat(amount) * (parseFloat(tds[0].individual) / 100)));
                                }
                            }
                        });
                    }
                });
            }
        }else{
            toastr.warning("Please Select Journal Type");
        }
    }

    function removebtn(value, row, index) {
        if (row.editing) {
            var s = '<a href="javascript:void(0)" class="btn btn-success btn-sm" style="pointer-events:auto; opacity:1;" onclick="saverow(this)">Save</a> ';
            var c = '<a href="javascript:void(0)" class="btn btn-danger btn-sm" style="pointer-events:auto; opacity:1;" onclick="cancelrow(this)">Cancel</a>';
            return s + c;
        } else {
            if(row.currency != "TOTAL"){
                var e = '<a href="javascript:void(0)" class="btn btn-primary btn-sm" style="pointer-events:auto; opacity:1;" onclick="editrow(this)">Edit</a> ';
                var d = '<a href="javascript:void(0)" class="btn btn-danger btn-sm" style="pointer-events:auto; opacity:1;" onclick="deleterow(this, '+row.id+')">Delete</a>';

                return e + d;
            }
        }
    }

    function getRowIndex(target) {
        var tr = $(target).closest('tr.datagrid-row');
        return parseInt(tr.attr('datagrid-row-index'));
    }

    function editrow(target) {
        var modul = $("#modul").textbox('getValue')

        if(modul == "ADJUSTMENT"){
            $('#dg2').datagrid('selectRow', getRowIndex(target));
            $('#dg2').datagrid('beginEdit', getRowIndex(target));
        }else{
            toastr.warning("Not Available for Modul " + modul);
        }
    }

    function saverow(target) {
        $('#dg2').datagrid('endEdit', getRowIndex(target));

        var rows = $('#dg2').datagrid('getRows');
        var totalrows = rows.length;

        var original_debit = 0;
        var original_credit = 0;
        var local_debit = 0;
        var local_credit = 0;
        for (let i = 0; i < totalrows; i++) {
            original_debit += parseFloat(rows[i].original_debit);
            original_credit += parseFloat(rows[i].original_credit);
            local_debit += parseFloat(rows[i].local_debit);
            local_credit += parseFloat(rows[i].local_credit);
        }

        $('#dg2').datagrid('reloadFooter', [{
            currency: "TOTAL",
            original_debit: original_debit,
            original_credit: original_credit,
            local_debit: local_debit,
            local_credit:local_credit
        }]);

        $("#local_debit").numberbox('setValue', local_debit);
        $("#local_credit").numberbox('setValue', local_credit);
    }

    function reverse(){
        var row = $('#dg').datagrid('getSelected');
        if (row) {
            // toastr.warning("Not Available");
            $('#dlg_insert').dialog('open');
            // $('#frm_insert').form('load', row);
            $('#frm_insert').form('clear');

            proses = "REVERSE";

            $("#modul").textbox('setValue', "ADJUSTMENT");
            $("#journal_date").datebox('setValue', row.journal_date);
            $("#journal_category").combobox('setValue', row.modul);
            $("#journal_type").combogrid('setValue', '20241120000001');
            $("#document_no").textbox('setValue', row.document_no);
            $("#document_date").datebox('setValue', row.document_date);
            $("#remarks").textbox('setValue', row.remarks);

            $("#journal_date").datebox('enable');
            $("#modul").textbox('enable');
            $("#journal_type").combogrid('enable');
            $("#company_name").combobox('enable');
            $("#document_no").textbox('enable');
            $("#number").textbox('enable');
            $("#append").linkbutton('disable');

            var lastIndex;
            $('#dg2').datagrid({
                url: '<?= base_url('finance/journal_posting_adjustments/reverse') ?>?number=' + window.btoa(row.number),
                onLoadSuccess: function(data){
                    $("#local_debit").numberbox('setValue', data['footer'][0].local_debit);
                    $("#local_credit").numberbox('setValue', data['footer'][0].local_credit);
                },
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

        } else {
            toastr.warning("Please select one of the data in the table first!", "Information");
        }
    }

    function cancelrow(target) {
        $('#dg2').datagrid('cancelEdit', getRowIndex(target));
    }

    function deleterow(target, id) {
        $.messager.confirm('Confirm', 'Are you sure you want to delete this data?', function(r) {
            if (r) {
                $.ajax({
                    method: 'post',
                    url: '<?= base_url('finance/journal_posting_adjustments/delete') ?>',
                    data: {
                        id: id,
                    },
                    success: function(result) {
                        var result = eval('(' + result + ')');
                        toastr.success(result.message);
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        $('#dg2').datagrid('deleteRow', getRowIndex(target));
                        // toastr.error("This data is already used in other modules, You must delete it First", "Error");
                    },
                    complete: function(data) {
                        $('#dg2').datagrid('reload');

                        var rows = $('#dg2').datagrid('getRows');
                        var totalrows = rows.length;

                        var original_debit = 0;
                        var original_credit = 0;
                        var local_debit = 0;
                        var local_credit = 0;
                        for (let i = 0; i < totalrows; i++) {
                            original_debit += parseFloat(rows[i].original_debit);
                            original_credit += parseFloat(rows[i].original_credit);
                            local_debit += parseFloat(rows[i].local_debit);
                            local_credit += parseFloat(rows[i].local_credit);
                        }

                        $("#local_debit").numberbox('setValue', local_debit);
                        $("#local_credit").numberbox('setValue', local_credit);
                    }
                });
            }
        });
    }

    //EDIT DATA
    function update() {
        var row = $('#dg').datagrid('getSelected');
        if (row) {
            // toastr.warning("Not Available");
            $('#dlg_insert').dialog('open');
            $('#frm_insert').form('load', row);
            
            proses = "UPDATE";

            $("#journal_date").datebox('disable');
            $("#modul").textbox('disable');
            $("#journal_type").combogrid('disable');
            $("#company_name").combobox('disable');
            $("#document_no").combobox('disable');
            $("#number").textbox('disable');
            $("#append").linkbutton('enable');

            setTimeout(function() {
                $("#number").textbox('setValue', row.number);
                $("#modul").textbox('setValue', row.modul);
                $("#journal_type").textbox('setValue', row.journal_type_id);
            }, 2000);


            var lastIndex;
            $('#dg2').datagrid({
                url: '<?= base_url('finance/journal_posting_adjustments/datatableUpdates') ?>?number=' + window.btoa(row.number),
                onLoadSuccess: function(data){
                    $("#local_debit").numberbox('setValue', data['footer'][0].local_debit);
                    $("#local_credit").numberbox('setValue', data['footer'][0].local_credit);
                },
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

        } else {
            toastr.warning("Please select one of the data in the table first!", "Information");
        }
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
                                    url: '<?= base_url('finance/journal_posting_adjustments/delete') ?>',
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
        $("#dlg_journal").dialog('open');

        var rows = $('#dg2').datagrid('getRows');
        var totalrows = rows.length;
        endEditing();

        if (totalrows > 0) {
            var jsonData = JSON.stringify(rows);

            $.ajax({
                type: "POST",
                url: "<?= base_url('finance/journal_posting_adjustments/createJson') ?>",
                data: {
                    jsonData: jsonData,
                },
                success: function(response) {
                    $('#dg4').datagrid({
                        url: '<?= base_url('finance/journal_posting_adjustments/calculateJournal') ?>',
                        pagination: false,
                        rownumbers: true,
                    });
                },
            });
        } else {
            toastr.warning("No Data to Preview");
        }
    }

    //FILTER DATA
    function filter() {
        var filter_from = $("#filter_from").datebox('getValue');
        var filter_to = $("#filter_to").datebox('getValue');
        var filter_journal_type = $("#filter_journal_type").combogrid('getValue');
        var filter_voucher = $("#filter_voucher").textbox('getValue');

        var url = "?filter_from=" + window.btoa(filter_from) +
            "&filter_to=" + window.btoa(filter_to) +
            "&filter_journal_type=" + window.btoa(filter_journal_type) +
            "&filter_voucher=" + window.btoa(filter_voucher);

        $('#dg').datagrid({
            url: '<?= base_url('finance/journal_posting_adjustments/datatables') ?>' + url,
            pagination: true,
            rownumbers: true,
            fit:true,
        });

        $("#printout").contents().find('html').html("<center><br><br><br><b style='font-size:20px;'>Please Wait...</b></center>");
        $("#printout").attr('src', '<?= base_url('finance/journal_posting_adjustments/print') ?>' + url);
    }

    //PRINT PDF
    function pdf() {
        $("#printout").get(0).contentWindow.print();
    }

    //PRINT EXCEL
    function excel() {
        var filter_from = $("#filter_from").datebox('getValue');
        var filter_to = $("#filter_to").datebox('getValue');
        var filter_journal_type = $("#filter_journal_type").combogrid('getValue');
        var filter_voucher = $("#filter_voucher").textbox('getValue');

        var url = "?filter_from=" + window.btoa(filter_from) +
            "&filter_to=" + window.btoa(filter_to) +
            "&filter_journal_type=" + window.btoa(filter_journal_type) +
            "&filter_voucher=" + window.btoa(filter_voucher);

        window.location.assign('<?= base_url('finance/journal_posting_adjustments/print/excel') ?>' + url);
    }

    //UPLOAD DATA
    function upload() {
        $('#dlg_upload').dialog('open');
    }

    //DOWNLOAD TEMPLATE UPLOAD
    function download_excel() {
        window.location.assign('<?= base_url('template/tmp_journal_posting_adjustments.xls') ?>');
    }

    function print_voucher() {
        var row = $('#dg').datagrid('getSelected');

        if (row) {
            window.open("<?= base_url('finance/journal_posting_adjustments/print_voucher/') ?>" + window.btoa(row.number), "_blank", 'location=yes,height=600,width=1200,scrollbars=yes,status=yes');
        } else {
            toastr.warning("Please select GL No in the table first!");
        }
    }

    //RELOAD
    function reload() {
        window.location.reload();
    }

    $(function() {
        filter();

        //SAVE DATA
        $('#dlg_insert').dialog({
            buttons: [{
                text: 'Save All',
                iconCls: 'icon-ok',
                handler: function() {
                    var journal_date = $("#journal_date").datebox('getValue');
                    var modul = $("#modul").textbox('getValue');
                    var journal_type = $("#journal_type").combogrid('getValue');
                    var number = $("#number").textbox('getValue');
                    var remarks = $("#remarks").textbox('getValue');
                    var document_date = $("#document_date").datebox('getValue');
                    var document_no = $("#document_no").textbox('getValue');

                    var local_debit = $("#local_debit").numberbox('getValue');
                    var local_credit = $("#local_credit").numberbox('getValue');

                    endEditing();
                    //var rows = $('#dg2').datagrid('getSelections');
                    var rows = $('#dg2').datagrid('getRows');
                    var totalrows = rows.length;

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
                                if(local_debit == local_credit){
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

                                            if (totalrows > 0) {
                                                requestData(totalrows, rows);
                                                $('#dlg_insert').dialog('close');
                                                $('#dlg_generate').dialog('open');

                                                function requestData(total, json, jml = 1, value = 0) {
                                                    if (value < 100) {
                                                        value = Math.floor((jml / total) * 100);
                                                        var i = (jml - 1);

                                                        $('#p_upload').progressbar('setValue', value);
                                                        $('#p_start').html(jml);
                                                        $('#p_finish').html(totalrows);

                                                        $.ajax({
                                                            type: "post",
                                                            url: '<?= base_url('finance/journal_posting_adjustments/create') ?>',
                                                            data: {
                                                                journal_date: journal_date,
                                                                modul: modul,
                                                                journal_type_id: journal_type,
                                                                number: number,
                                                                remarks: remarks,
                                                                proses: proses,
                                                                id: json[i].id,
                                                                document_no: document_no,
                                                                document_date: document_date,
                                                                amount: json[i].amount,
                                                                taxes: json[i].taxes,
                                                                taxes_amount: json[i].taxes_amount,
                                                                debitcredit: json[i].debitcredit,
                                                                account_number: json[i].account_number,
                                                                account_name: json[i].account_name,
                                                                description: json[i].description,
                                                                company_id: json[i].company_id,
                                                                company_name: json[i].company_name,
                                                                currency: json[i].currency,
                                                                local_debit: json[i].local_debit,
                                                                local_credit: json[i].local_credit
                                                            },
                                                            dataType: "json",
                                                            success: function(result) {
                                                                requestData(total, json, jml + 1, value);

                                                                if (result.theme == "success") {
                                                                    var title = "<b style='color: green;'>" + result.title + "</b> | " + result.message;
                                                                } else {
                                                                    var title = "<b style='color: red;'>" + result.title + "</b> | " + result.message;
                                                                }

                                                                $("#p_remarks").append(title + "<br>");

                                                                if (i == (totalrows - 1)) {
                                                                    Swal.close();
                                                                    $('#dlg_generate').dialog('close');

                                                                    Swal.fire({
                                                                        title: result.message,
                                                                        icon: result.theme,
                                                                        confirmButtonText: 'Ok',
                                                                        allowOutsideClick: false,
                                                                    }).then((result) => {
                                                                        if (result.isConfirmed) {
                                                                            // window.location.reload();
                                                                            $("#dg").datagrid('reload');
                                                                        }
                                                                    });
                                                                }
                                                            }
                                                        });
                                                    }
                                                }
                                            }
                                        }
                                    });
                                } else {
                                    toastr.error("Debit & Credit Not Balance");
                                }
                            } else {
                                toastr.info("Please Checklist Posting");
                            }
                        }
                    });
                }
            }]
        });

        $('#dlg_upload').dialog({
            buttons: [{
                text: 'List Failed',
                handler: function() {
                    window.open('<?= base_url('finance/journal_posting_adjustments/uploadDownloadFailed') ?>', '_blank');
                }
            }, {
                text: 'Upload',
                iconCls: 'icon-ok',
                handler: function() {
                    $('#frm_upload').form('submit', {
                        url: '<?= base_url('finance/journal_posting_adjustments/upload') ?>',
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
                                url: "<?= base_url('finance/journal_posting_adjustments/uploadclearFailed') ?>"
                            });
                            var json = eval('(' + result + ')');
                            requestData(json.total, json);

                            function requestData(total, json, number = 1, value = 0, success = 1, failed = 1) {
                                if (value < 100) {
                                    value = Math.floor((number / total) * 100);
                                    $('#p_upload2').progressbar('setValue', value);
                                    $('#p_start2').html(number);
                                    $('#p_finish2').html(total);
                                    $.ajax({
                                        type: "POST",
                                        async: true,
                                        url: "<?= base_url('finance/journal_posting_adjustments/uploadCreate') ?>",
                                        data: {
                                            "data": json[number - 1]
                                        },
                                        cache: false,
                                        dataType: "json",
                                        success: function(result) {
                                            if (result.theme == "success") {
                                                $('#p_success2').html(success);
                                                var title = "<b style='color: green;'>" + result.title + "</b> | " + result.message;
                                                requestData(total, json, number + 1, value, success + 1, failed + 0);
                                            } else {
                                                $('#p_failed2').html(failed);
                                                var title = "<b style='color: red;'>" + result.title + "</b> | " + result.message;
                                                //Json Failed
                                                $.ajax({
                                                    type: "POST",
                                                    async: true,
                                                    url: "<?= base_url('finance/journal_posting_adjustments/uploadcreateFailed') ?>",
                                                    data: {
                                                        data: json[number - 1],
                                                        message: result.message
                                                    },
                                                    cache: false
                                                });
                                                requestData(total, json, number + 1, value, success + 0, failed + 1);
                                            }
                                            $("#p_remarks2").append(title + "<br>");
                                        }
                                    });
                                }
                            }
                        }
                    });
                }
            }]
        });

        $("#filter_journal_type").combogrid({
            url: '<?= base_url('finance/journal_posting_adjustments/readJournalType?modul=') ?>',
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

        $("#journal_type").combogrid({
            url: '<?= base_url('finance/journal_posting_adjustments/readJournalType') ?>',
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
            url: '<?= base_url('finance/journal_posting_adjustments/datatableDetails?number=') ?>' + btoa(number),
            pagination: false,
            rownumbers: true,
            remoteFilter: true,
        }).datagrid('enableFilter');
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