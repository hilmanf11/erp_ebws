<?php 
/* ------------------------------------------ 
 *  Quality Assurance System
 *  Version 1.2
 *  Author: Hilman Fadillah
 *  Dept IT - Banshu Electric Indonesia
 * ------------------------------------------
 */
  error_reporting(0);
  include '../page/menu.php';
  include '../proses/proses_receiving.php';
  date_default_timezone_set("Asia/Jakarta");

  
?>
<html>
<head>
  <link href="../css/simplelightbox.min.css" rel='stylesheet' type='text/css'>
  <link href="../css/jquery.pan.css" rel="stylesheet" type="text/css"/>
  <style>
    .active {
      pointer-events: none;
      cursor: default;
    } 
    .level_input {
        font-size: 24px;
        height: 30px;
        width: 50px;
        text-align: center;
    }
    .level {
        margin-left: 150px;
    }
    
 </style>

</head>
<body>
<div id="preloader">
    <div id="status"></div>
</div>
<div class="main">
  <div class="main-inner">
    <div class="container">
      <div class="row">
        <div class="span12">
        	<?php if(@$qty < @$sample and @$qty != ""){ ?>
            
            <div class="widget-content">
              <div class="alert alert-success">
                <h4>Success !!</h4>
                Checking has been completed. . 
              </div>
            </div>

            <?php }elseif(@$mpq > @$qty_receive){ ?>

            <div class="widget-content">
              <div class="alert alert-warning">
                <h4>Warning !!</h4>
                Receive Qty is lower than MPQ/Packing! QR code may not be printed. .
              </div>
            </div>

            <?php }elseif(@$mpq == "" and @$qty != ""){ ?>

            <div class="widget-content">
              <div class="alert alert-danger">
                <h4>No Balance !!</h4>
                No MPQ or Packing Quantity? Add data in <b>the Master data menu -> Master Standard</b> so that it can be processed further
              </div>
            </div>

            <?php } ?>
          <form class="form-horizontal" name="import" method="post">
            <!-- Paling Atas -->  
            <div class="widget-content">
              <!-- Serial Number -->  
              <div class="span4">
                <div class="control-group">								
                  <b>
                    <input type="text" id="scan" value="<?php echo @$serial_no; ?>" class="span4" name="serial" autofocus style="height:50px; font-size:30px;">
                  </b>			
                </div>
              </div>
                
              <div class="span2">
                <div class="control-group">
                  <input type="text" value="<?php echo @$item_id; ?>" class="span2" name="item_id" readonly>
                </div>
                <div class="control-group">
                  <input type="text" min="0" value="<?php echo @$item_name; ?>" class="span2" name="item_name" readonly>		
                </div>
              </div>
                
              <div class="span2">
                <div class="control-group">
                  <input style="width:80px;" value="<?php echo @$qty_receive; ?>" placeholder="QTY Receive" class="span1" name="qty_receive" type="number" />
                </div>
                <div class="control-group">

                  <select style="width:200px; font-size: 12px;" class="form-control select2-allow-clear" id="supplier" name="supplier">
                    <option value="" selected disabled>-Select Supplier-</option>
                      <?php
                        include '../koneksi2.php';
                        $sql = pg_query("SELECT trim(ven_id) ven_id, trim(ven_name) ven_name FROM r_vendor ORDER BY ven_name ASC");
                        
                        while ($row = pg_fetch_array($sql)) {
                          if(@$supplier == $row['ven_name']){
                            echo '<option value='.base64_encode($row['ven_id']).' selected>'.$row['ven_name'].'</option>';
                          }else{
                            echo '<option value='.base64_encode($row['ven_id']).'>'.$row['ven_name'].'</option>';
                          }
                        }
                        include '../koneksi.php';
                      ?>
                    </select>

                </div>
              </div>
                
              <div class="span1">							
                <div class="control-group">								
                  <label class="control-label">MPQ / Packing</label>							
                  <label style="font-size:40px; width: 200px;" class="control-label"><b><?php echo @$mpq ?></b></label>
                </div>
                <div class="hidden">
                  <input type="number" name="mpq" value="<?php echo @$mpq ?>">
                </div>	
               </div>
              
              <div class="span1">
                <div class="control-group">				
                  <div class="level">
                    Level
                    <input type="number" min="1" max="3" readonly value="<?php echo @$level; ?>" name="level" class="level_input">
                  </div>
                </div>
              </div>
            </div>
            
            <?php 
              if(end(explode(".", @$drawing)) == "pdf"){
                echo ' <a href="#m_drawing" class="btn btn-primary btn-small" data-toggle="modal" style=" width:150px;">DRAWING</a>';
              }else{
                echo ' <a  class="btn btn-primary btn-small" onclick="i_drawing()" style=" width:200px;">DRAWING</a>';
              }

              if(end(explode(".", @$sop)) == "pdf"){
                echo ' <a href="#m_sop" class="btn btn-primary btn-small" data-toggle="modal" style=" width:120px;">I S</a>';
              }else{
                echo ' <a class="btn btn-primary btn-small" onclick="i_sop()" style=" width:150px;">I S</a>';
              }

              if(end(explode(".", @$std)) == "pdf"){
                echo ' <a href="#m_standard" class="btn btn-primary btn-small" data-toggle="modal" style=" width:120px;">STANDARD</a>';
              }else{
                echo ' <a class="btn btn-primary btn-small" onclick="i_std()" style=" width:150px;">Standard</a>';
              }

              if(end(explode(".", @$millsheet)) == "pdf"){
                echo ' <a href="#m_mill" class="btn btn-primary btn-small" data-toggle="modal" style=" width:120px;">MILLSHEET</a>';
              }else{
                echo ' <a class="btn btn-primary btn-small" onclick="i_millsheet()" style=" width:150px;">MILLSHEET</a>';
              }

              if(end(explode(".", @$msds)) == "pdf"){
                echo ' <a href="#m_msds" class="btn btn-primary btn-small" data-toggle="modal" style=" width:150px;">MSDS</a>';
              }else{
               echo ' <a class="btn btn-primary btn-small" onclick="i_msds()" style=" width:170px;">MSDS</a>'; 
              }

              if(end(explode(".", @$rohs)) == "pdf"){
                echo ' <a href="#m_rohs" class="btn btn-primary btn-small" data-toggle="modal" style=" width:150px;">ROHS</a>';
              }else{
                echo ' <a class="btn btn-primary btn-small" onclick="i_rohs()" style=" width:200px;">ROHS</a>';
              }
            ?>
            
            <div class="gallery">
              <div class="widget-content">
                <!-- Gambar 1 -->
                <a href="<?php if(@$picture1 == ""){ echo "../images/null.png"; }else{ echo "../setting_item/pic1/".$picture1; }?>">
                  <img style="width:375px; height:250px;" src="<?php if(@$picture1 == ""){ echo "../images/null.png"; }else{ echo "../setting_item/pic1/".$picture1; }?>">
                </a>
                <!-- Gambar 2 -->
                <a href="<?php if(@$picture2 == ""){ echo "../images/null.png"; }else{ echo "../setting_item/pic2/".$picture2; }?>">
                  <img style="width:375px; height:250px;" src="<?php if(@$picture2 == ""){ echo "../images/null.png"; }else{ echo "../setting_item/pic2/".$picture2; }?>">
                </a>
                <!-- Gambar 3 -->
                <a href="<?php if(@$picture3 == ""){ echo "../images/null.png"; }else{ echo "../setting_item/pic3/".$picture3; }?>">
                  <img style="width:375px; height:250px;" src="<?php if(@$picture3 == ""){ echo "../images/null.png"; }else{ echo "../setting_item/pic3/".$picture3; }?>">
                </a>
                <!-- Gambar 4 -->
                <a href="<?php if(@$picture4 == ""){ echo "../images/null.png"; }else{ echo "../setting_item/pic4/".$picture4; }?>">
                  <img style="width:375px; height:250px;" src="<?php if(@$picture4 == ""){ echo "../images/null.png"; }else{ echo "../setting_item/pic4/".$picture4; }?>">
                </a>
                <!-- Gambar 5 -->
                <a href="<?php if(@$picture5 == ""){ echo "../images/null.png"; }else{ echo "../setting_item/pic5/".$picture5; }?>">
                  <img style="width:375px; height:250px;" src="<?php if(@$picture5 == ""){ echo "../images/null.png"; }else{ echo "../setting_item/pic5/".$picture5; }?>">
                </a>
                <!-- Gambar 6 -->
                <a href="<?php if(@$picture6 == ""){ echo "../images/null.png"; }else{ echo "../setting_item/pic6/".$picture6; }?>">
                  <img style="width:375px; height:250px;" src="<?php if(@$picture6 == ""){ echo "../images/null.png"; }else{ echo "../setting_item/pic6/".$picture6; }?>">
                </a>
                <!-- Gambar 7 -->
                <a href="<?php if(@$picture7 == ""){ echo "../images/null.png"; }else{ echo "../setting_item/pic7/".$picture7; }?>">
                  <img style="width:375px; height:250px;" src="<?php if(@$picture7 == ""){ echo "../images/null.png"; }else{ echo "../setting_item/pic7/".$picture7; }?>">
                </a>
                <!-- Gambar 8 -->
                <a href="<?php if(@$picture8 == ""){ echo "../images/null.png"; }else{ echo "../setting_item/pic8/".$picture8; }?>">
                  <img style="width:375px; height:250px;" src="<?php if(@$picture8 == ""){ echo "../images/null.png"; }else{ echo "../setting_item/pic8/".$picture8; }?>">
                </a>
              </div>
            </div>
            
            <div hidden="true">
              <button type="submit" name="manggil" id="manggil" class="btn btn-info">Scan</button>
            </div>  
            
            <?php  if(@$serial_no == ""){ ?>
            
            <div class="widget-content boxx">
              <div class="alert alert-danger">
                <h4>Blocked!!</h4>
                Scan Serial Number in the Column above to Access Receiving System.
              </div>
            </div>
            
           <?php 
           
            }else{ 
              if(@$qty == ""){
                
            ?>
            
            <div class="widget-content boxx">
              <div class="alert alert-danger">
                <h4>Warning !!</h4>
                Total Sample is still 0, not checking if sample Item is still 0
              </div>
            </div>
            
             <?php }elseif($_SESSION['role_id'] == "3"){ ?>

              <div class="widget-content boxx">
                <div class="alert alert-danger">
                  <h4>Warning !!</h4>
                  This page is Blocked
                </div>
              </div>

              <?php }else{ ?>
            
            <div class="widget-content boxx"> Sample No &nbsp;
              <input type="text" readonly name="sample" value="<?php echo @$sample; ?>" style="width: 30px;"> &nbsp; Check &nbsp;
              <input type="text" readonly name="id" value="<?php echo @$id; ?>" style="display: none;">
              <?php
                $sqlins = pg_query("SELECT * FROM mst_inspection WHERE item_name='$item_name' ORDER BY process_inspection ASC LIMIT $start OFFSET $id");
                $data = pg_fetch_array($sqlins);
                  echo '<input type="text" readonly name="nama_inspection" value="'.@$data['process_inspection'].'" class="span2">';
              ?>

              <button type="submit" name="openird" class="btn">Open IRD</button>
              <button type="submit" name="nextcheck" <?php if($id == ($rows - 1) or $ng_lv < $jumlah_ng or $qty < $sample){  echo 'class="active btn btn-danger"'; }else{ echo 'class="btn"'; } ?>>Next Check</button>
              <button type="submit" name="nextsample" <?php if($id == ($rows - 1)){ echo 'id="blink_me" class="btn btn-success"'; }else{ echo 'disabled class="btn btn-danger"'; } ?>>Next Sample</button>
              <button type="submit" name="nextng" class="btn btn-primary">NG</button>
              <input class="form-control" type="text" value="<?php if(@$_POST['jumlah_ng'] == ""){ echo "0"; }else{ echo $jumlah_ng; }?>" style="width:30px;" name="jumlah_ng" readonly />  

              &nbsp;
              <div style="display:none">
                 <b> Tooling </b>&nbsp;

                <select style="width:150px;" class="form-control select2-allow-clear" id="select2-single-append" name="tooling">
                    <option value="" selected disabled>-Select Tooling-</option>
                    <?php
                      $sqltooling = pg_query("SELECT * FROM mst_tooling");
                      while ($row_tooling = pg_fetch_array($sqltooling)){
                    ?>
                    <option value="<?php echo $row_tooling['tooling_name']; ?>"><?php echo $row_tooling['tooling_name']; ?></option>
                      <?php } ?>
                </select>
              </div>
             
              &nbsp;<b> Visual </b> &nbsp;
              <!-- <select style="width:80px;" class="form-control" name="visual">
                  <option value="OK" selected>OK</option>
                  <option value="BLUMMING">BLUMMING</option>
                  <option value="SOBEK">KARATAN</option>
                  <option value="KARATAN">SOBEK</option>
                  <option value="PENYOK">PENYOK</option>
                  <option value="SHORT MOLD">SHORT MOLD</option>
                  <option value="BURRY">BURRY</option>
                  <option value="BUBBLE">BUBBLE</option>
                  <option value="BLACK DOT">BLACK DOT</option>
                  <option value="SCRATCH">SCRATCH</option>
                  <option value="WELD LINE">WELD LINE</option>
                  <option value="BENDING">BENDING</option>
                  <option value="DISCCOLAR">DISCCOLAR</option>
                  <option value="SALAH LABEL">SALAH LABEL</option>
              </select> -->
              <input type="text" style="width:200px;" name="visual" id="visual" />

            </div>
            
            <?php 
              $sqlins2 = pg_query("SELECT * FROM mst_inspection WHERE item_name='$item_name' ORDER BY process_inspection ASC LIMIT $start OFFSET $id");
              $data2 = pg_fetch_array($sqlins2);
            ?>
            <div class="widget-content">
              <div class="span5">
                <div class="control-group">								
                  <label>QC Critical Notes &nbsp; <a onclick="i_critical()">View Image</a></label>
                  <marquee onmouseover="this.stop()" onmouseout="this.start()" scrollamount="2" direction="up" style="background: #ffbdbd; text-align: center; font-size: 20px;" width="100%" height="80" align="center" behavior=”alternate”><b><?php echo $data2['note_critical']; ?></b></marquee>
                </div>
              </div>
              <div class="span6">
                <div class="control-group">								
                  <label>QC Warning Notes &nbsp; <a onclick="i_warning()">View Image</a></label>
                  <marquee onmouseover="this.stop()" onmouseout="this.start()" scrollamount="2" direction="up" style="background: #fff2ab; text-align: center; font-size: 20px;" width="100%" height="80" align="center" behavior=”alternate”><b><?php echo $data2['note_warning']; ?></b></marquee>
                </div>
              </div>
            </div>
            <?php } ?>
            <div class="widget-content boxx">
              <div class="span4">
                 <div class="control-group">								
                      <label class="control-label">Total Sample & NG</label>
                      <div class="controls">
                          <input type="text" readonly value="<?php echo @$qty; ?>" class="span1" name="total_sample">
                          <input type="text" readonly value="<?php echo @$ng_lv; ?>" class="span1" style="background-color: #FF9D9D;" name="total_ng">
                      </div>			
                 </div>
              </div>

            <div class="span3">
              <div class="control-group">								
                 <label class="control-label">Judgement</label>
                 <div class="controls">
                     <?php if(@$ng_lv < @$jumlah_ng){
                       echo '<input type="radio" value="OK" name="judge" disabled> OK &nbsp
                             <input type="radio" value="NG" name="judge" checked> NG';
                       }else{

                       echo '<input type="radio" value="OK" name="judge" checked> OK &nbsp
                           <input type="radio" value="NG" name="judge" disabled> NG';
                       }
                     ?>
                 </div>			
              </div>
            </div>
            <div class="span12" hidden="">
            <?php 
              if(isset($_POST['finish'])){
                echo '<input type="text" name="sj" value="'.$_POST['no_sj'].'">';
              }
            ?>
            </div>
            <div class="span4">
                 <button type="submit" <?php if(isset($_POST['finish'])){ echo 'id="blink_me2"'; }elseif($_SESSION['role_id'] == "3"){ echo 'disabled'; }else{ echo 'disabled'; } ?> name="barcode" class="btn btn-info" style="width:150px;">Print QRcode</button>
                 <button type="button" <?php if($_SESSION['role_id'] == "3"){ echo 'disabled'; } ?> data-toggle="modal" href="#sj" <?php if(@$_POST['finish'] or @$qty == "" or @$mpq == ""){ echo 'disabled'; } ?> class="btn btn-success" style="width:120px;">Finish</button>
                 <a type="button" href="receiving_system.php" class="btn btn-danger" style="width:60px;">Refresh</a>
            </div>
            
            <!-- Modal Surat Jalan -->
            <div id="sj" class="modal hide fade" style="width:700px; top: 330px; left: 600px;">
              <div class="modal-header">
                <h3>GRN No <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button></h3>
              </div>
              <div class="modal-body">
                <div class="widget-content" id="peringatan_nosurat" hidden="true">
                    <div class="alert alert-danger">
                      <h4>Sorry !!</h4>
                      Road Letter No is still Blank? Please fill it in first
                    </div>
                </div>

                <div class="widget-content" id="peringatan_qty" hidden="true">
                    <div class="alert alert-danger">
                      <h4>Sorry !!</h4>
                      you cannot save because Qty Inspect > Qty Receipt or Qty Inspect is 0
                    </div>
                </div>
                  <!-- <select style="width: 100%;" class="form-control select2-allow-clear" id="receipt_no2" name="receipt_no2"> -->
                  <select style="width: 100%; height: 60px !important; font-size:30px;" id="receipt_no2" name="receipt_no2">
                    <option value="" selected disabled>-Select Receipt No-</option>
                    <?php
                      $curl = curl_init();

                      curl_setopt($curl, CURLOPT_URL, 'http://192.168.11.4/dummy/purchase/purchase_order_receipts/reads?item_rm_number='.base64_encode($item_id)); 
                      // curl_setopt($curl, CURLOPT_URL, 'http://cloud.astechno.net/erp-ebws/purchase/purchase_order_receipts/reads?item_rm_number='); 
                      curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
                      
                      $response = curl_exec($curl);
                      $data = json_decode($response);

                      curl_close($curl);
                      foreach ($data as $item) {
                        echo '<option value='.$item->receipt_no.'|'.$item->qty_receipt.'|'.$item->bc_document.'>'.$item->receipt_no.'</option>';
                      }
                    ?>
                  </select>

                  <table style="width: 100%;">
                    <tr>
                      <td><small>Item ID</small><br><input type="text" id="item_id" readonly name="item_id" value="<?= $item_id ?>" style="font-size: 12px;" placeholder="Item No"></td>
                      <td><small>Qty Receipt</small><br><input type="numberbox" id="qty" readonly name="qty" style="font-size: 12px; width:100px;" placeholder="Qty"></td>
                      <td><small>Qty Inspect</small><br><input type="numberbox" value="<?= $qty_receive ?>" id="qty_qas" readonly name="qty_qas" style="font-size: 12px; width:100px;" placeholder="Qty QAS"></td>
                      <td><small>Invoice No</small><br><input type="text" id="no_sj" readonly name="no_sj" style="font-size: 10px;" placeholder="Invice No"></td>
                      <td hidden><input type="text" id="receipt_no" name="receipt_no" style="font-size: 10px;" placeholder="Receipt No"></td>
                    </tr>
                  </table>
              </div>
              <div class="modal-footer">
                <button class="btn" id="finish" name="finish" type="submit">Save Data</button>              
              </div>
            </div>
          </div>
          <?php }  ?>
        </form>
     </div>
   </div>
</div>

<!-- Modal PDF -->
<div id="m_drawing" class="modal hide fade" style="width:1250px; left:330px; top: 330px;">
  <div class="modal-header">
    <h3>Drawing <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button></h3>
  </div>
  <div class="modal-body">
    <embed src="../setting_drawing/drawing/<?= $drawing ?>" type="application/pdf" width="1200" height="400" />
  </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal">Cancel</button>              
  </div>
</div>

<div id="m_sop" class="modal hide fade" style="width:1250px; left:330px; top: 330px;">
  <div class="modal-header">
    <h3>SOP <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button></h3>
  </div>
  <div class="modal-body">
    <embed src="../setting_drawing/sop/<?= $sop ?>" type="application/pdf" width="1200" height="400" />
  </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal">Cancel</button>              
  </div>
</div>

<div id="m_standard" class="modal hide fade" style="width:1250px; left:330px; top: 330px;">
  <div class="modal-header">
    <h3>Standard <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button></h3>
  </div>
  <div class="modal-body">
    <embed src="../setting_drawing/std/<?= $std ?>" type="application/pdf" width="1200" height="400" />
  </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal">Cancel</button>              
  </div>
</div>

<div id="m_mill" class="modal hide fade" style="width:1250px; left:330px; top: 330px;">
  <div class="modal-header">
    <h3>MillSheet <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button></h3>
  </div>
  <div class="modal-body">
    <embed src="../setting_drawing/mill/<?= $millsheet ?>" type="application/pdf" width="1200" height="400" />
  </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal">Cancel</button>              
  </div>
</div>

<div id="m_msds" class="modal hide fade" style="width:1250px; left:330px; top: 330px;">
  <div class="modal-header">
    <h3>MSDS <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button></h3>
  </div>
  <div class="modal-body">
    <embed src="../setting_drawing/msds/<?= $msds ?>" type="application/pdf" width="1200" height="400" />
  </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal">Cancel</button>              
  </div>
</div>

<div id="m_rohs" class="modal hide fade" style="width:1250px; left:330px; top: 330px;">
  <div class="modal-header">
    <h3>ROHS <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button></h3>
  </div>
  <div class="modal-body">
    <embed src="../setting_drawing/rohs/<?= $rohs ?>" type="application/pdf" width="1200" height="400" />
  </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal">Cancel</button>              
  </div>
</div>
</div>
</div>
<!-- Modal PDF -->
</body>
<script type="text/javascript" src="../js/simple-lightbox.js"></script>
<script src="../js/jquery.pan.js"></script>
<script src="../js/wheelzoom.js"></script>
<script src="../js/script.js"></script>
<script src="../js/select2.js"></script>
<script src="../js/select2-init.js"></script>
<script type="text/javascript">
     //Gambar pada Button yang berwarna Biru Zoom in dan Out
    $(document).ready(function(){
        $(".pan").pan();
    })
</script>

<script>
    //Gambar pada Picture 1 sampai 6
    $(function(){
        var $gallery = $('.gallery a').simpleLightbox();

        $gallery.on('show.simplelightbox', function(){
                console.log('Requested for showing');
        })
        .on('shown.simplelightbox', function(){
                console.log('Shown');
        })
        .on('close.simplelightbox', function(){
                console.log('Requested for closing');
        })
        .on('closed.simplelightbox', function(){
                console.log('Closed');
        })
        .on('change.simplelightbox', function(){
                console.log('Requested for change');
        })
        .on('next.simplelightbox', function(){
                console.log('Requested for next');
        })
        .on('prev.simplelightbox', function(){
                console.log('Requested for prev');
        })
        .on('nextImageLoaded.simplelightbox', function(){
                console.log('Next image loaded');
        })
        .on('prevImageLoaded.simplelightbox', function(){
                console.log('Prev image loaded');
        })
        .on('changed.simplelightbox', function(){
                console.log('Image changed');
        })
        .on('nextDone.simplelightbox', function(){
                console.log('Image changed to next');
        })
        .on('prevDone.simplelightbox', function(){
                console.log('Image changed to prev');
        })
        .on('error.simplelightbox', function(e){
                console.log('No image found, go to the next/prev');
                console.log(e);
        });
    });
  (function blink() { 
      $('#blink_me').fadeOut(500).fadeIn(500, blink); 
  })();

  (function blink2() { 
      $('#blink_me2').fadeOut(500).fadeIn(500, blink2); 
  })();

    wheelzoom(document.querySelector('img.zoom'));

    function i_drawing(){
      window.open("drawing.php?drawing=<?php echo @$drawing ?>", "", "width=1070,height=700,left=100");
    }
    function i_sop(){
      window.open("drawing.php?sop=<?php echo @$sop ?>", "", "width=1070,height=700,left=100");
    }
    function i_std(){
      window.open("drawing.php?std=<?php echo @$std ?>", "", "width=1070,height=700,left=100");
    }
    function i_millsheet(){
      window.open("drawing.php?mill=<?php echo @$millsheet ?>", "", "width=1070,height=700,left=100");
    }
    function i_msds(){
      window.open("drawing.php?msds=<?php echo @$msds ?>", "", "width=1070,height=700,left=100");
    }
    function i_rohs(){
      window.open("drawing.php?rohs=<?php echo @$rohs ?>", "", "width=1070,height=700,left=100");
    }
    
    function i_critical(){
      window.open("drawing.php?critical=<?php echo @$picture_critical ?>", "", "width=1070,height=400,left=100, top=200");
    }
    function i_warning(){
      window.open("drawing.php?warning=<?php echo @$picture_warning ?>", "", "width=1070,height=400,left=100, top=200");
    }

    $('#finish').click(function(){
      if(parseInt($("#qty_qas").val()) == 0){
        $('#peringatan_qty').show('slow');
        return false;
      }

      if(parseInt($("#qty_qas").val()) > parseInt($("#qty").val())){
        $('#peringatan_qty').show('slow');
        return false;
      }

       if($('#no_sj').val() == ''){
          $('#peringatan_nosurat').show('slow');
          //alert('No Surat Jalan harus di Isi terlebih dahulu!! ');
          return false;
       }
    });
    
    
  $('#supplier').click(function(e) {
    document.getElementById("manggil").click();
  });

  $("#receipt_no2").live('change', function(){
    var result = $(this).val().split('|');
    $("#qty").val(result[1]);
    $("#no_sj").val(result[2]);
    $("#receipt_no").val(result[0]);
  });

  // function receipt_no(val){
  //   alert(val);
  // }

  $(`#visual`).select2({
    ajax: {
      url: `../proses/proses_receiving.php?getDataNg=true`,
      dataType: 'json',
      results: function (data) {
        var myResults = [];
        $.each(data, function (index, item) {
            myResults.push({
                'id': item.ng_name,
                'text': item.ng_name
            });
        });
        return {
            results: myResults
        };
    }
    }
  });
  </script>
</html>