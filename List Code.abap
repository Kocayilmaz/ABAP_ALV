REPORT z_alv_8. 

TYPE-POOLS : slis. 
TABLES : knb1,kna1,knvv,t151t,t171t,tvkbt,tvgrt,adr6,tb038b,ZFI_CKML_ACD_V1 . 

DATA : it_fields TYPE slis_t_fieldcat_alv, 
       wa_fields TYPE slis_fieldcat_alv, 
       wa_layout TYPE slis_layout_alv, 
       p_extab   TYPE  slis_t_extab. 

DATA LT_CKML LIKE TABLE OF ZFI_CKML_ACD_V1 . 
data Ls_CKML LIKE LINE OF LT_CKML .
 
DATA : BEGIN OF gt_list OCCURS 0, 
         bukrs             LIKE knb1-bukrs, 
         kunnr             LIKE knb1-kunnr, 
         akont             LIKE knb1-akont, 
         zterm             LIKE knb1-zterm, 
         name1             LIKE kna1-name1, 
         name2             LIKE kna1-name2, 
         land1             LIKE kna1-land1, 
         pstlz             LIKE kna1-pstlz, 
         ort01             LIKE kna1-ort01, 
         stras             LIKE kna1-stras, 
         telf1             LIKE kna1-telf1, 
         telfx             LIKE kna1-telfx, 
         adrnr             LIKE kna1-adrnr, 
         ktokd             LIKE kna1-ktokd, 
         stcd1             LIKE kna1-stcd1, 
         stcd2             LIKE kna1-stcd2, 
         vkorg             LIKE knvv-vkorg, 
         kdgrp             LIKE knvv-kdgrp, 
         ktext             LIKE t151t-ktext, 
         bzırk             LIKE knvv-bzırk, 
         bztxt             LIKE t171t-bztxt, 
         vkbur             LIKE knvv-vkbur, 
         bezei             LIKE tvkbt-bezei, 
         vkgrp             LIKE knvv-vkgrp, 
         bezei2            LIKE tvgrt-bezei, 
         kurst             LIKE knvv-kurst, 
         smtp_addr         LIKE adr6-smtp_addr, 
         ind_sector_1      LIKE tb038b-ind_sector, 
         ind_sector_text_1 LIKE tb038b-text, 
         ind_sector_2      LIKE tb038b-ind_sector, 
         ind_sector_text_2 LIKE tb038b-text, 
       END OF gt_list. 


******************************************************************* 

SELECTION-SCREEN BEGIN OF BLOCK block1 WITH FRAME TITLE TEXT-001 . 
PARAMETERS p_bukrs LIKE knb1-bukrs OBLIGATORY . 
SELECT-OPTIONS: s_kunnr FOR knb1-kunnr , 
                gv_tarih FOR knb1-erdat . 
SELECTION-SCREEN END OF BLOCK block1. 

**************************************************************** 
START-OF-SELECTION . 
  
SELECT * FROM knb1 INTO CORRESPONDING FIELDS OF TABLE gt_list
    WHERE bukrs = p_bukrs AND 
    kunnr IN s_kunnr AND 
    erdat IN gv_tarih  .
 
LOOP AT gt_list. 

    SELECT SINGLE * FROM kna1 INTO  CORRESPONDING FIELDS OF gt_list 
          WHERE kunnr = gt_list-kunnr.
    SELECT SINGLE * FROM knvv INTO CORRESPONDING FIELDS OF gt_list 
          WHERE kunnr = gt_list-kunnr. 
    SELECT SINGLE smtp_addr FROM adr6 INTO gt_list-smtp_addr 
        WHERE addrnumber = gt_list-adrnr. 
    SELECT SINGLE  ktext FROM t151t INTO gt_list-ktext 
                WHERE kdgrp = gt_list-kdgrp 
                AND spras  = sy-langu. 
    SELECT SINGLE bztxt FROM t171t INTO gt_list-bztxt 
                WHERE bzirk = gt_list-bzirk 
                AND spras = sy-langu.
    SELECT SINGLE bezei FROM tvkbt INTO gt_list-bezei 
                WHERE vkbur = gt_list-vkbur 
                 AND spras = sy-langu. 
    SELECT SINGLE bezei FROM tvgrt INTO gt_list-bezei2 
                 WHERE vkgrp = gt_list-vkgrp 
                  AND spras = sy-langu. 
  ENDLOOP . 

********************************************************************** 
  CALL FUNCTION 'REUSE_ALV_FIELDCATALOG_MERGE' 

    EXPORTING 
      i_program_name         = sy-repid 
      i_internal_tabname     = 'GT_LIST' 
*     I_STRUCTURE_NAME       = 'gt_list' 
*     I_CLIENT_NEVER_DISPLAY = 'X' 
      i_inclname             = sy-repid 
*     I_BYPASSING_BUFFER     = 
*     I_BUFFER_ACTIVE        = 
    CHANGING 
      ct_fieldcat            = it_fields 
    EXCEPTIONS 
      inconsistent_interface = 1 
      program_error          = 2 
      OTHERS                 = 3. 
  IF sy-subrc <> 0. 
    " Implement suitable error handling here 
    MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno 
              WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4. 

  ENDIF. 

  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY' 
    EXPORTING 
*     I_INTERFACE_CHECK        = ' ' 
*     I_BYPASSING_BUFFER       = ' ' 
*     I_BUFFER_ACTIVE          = ' ' 
      i_callback_program       = sy-repid 
      i_callback_pf_status_set = 'STANDARD' 
     I_CALLBACK_USER_COMMAND  = 'USER_COMMAND ' 
*     I_CALLBACK_TOP_OF_PAGE   = ' ' 
*     I_CALLBACK_HTML_TOP_OF_PAGE       = ' ' 
*     I_CALLBACK_HTML_END_OF_LIST       = ' ' 
*     I_STRUCTURE_NAME         = 
*     I_BACKGROUND_ID          = ' ' 
*     I_GRID_TITLE             = 
*     I_GRID_SETTINGS          = 
      is_layout                = wa_layout 
      it_fieldcat              = it_fields 
*     IT_EXCLUDING             = 
*     IT_SPECIAL_GROUPS        = 
*     IT_SORT                  = 
*     IT_FILTER                = 
*     IS_SEL_HIDE              = 
*     I_DEFAULT                = 'X' 
    I_SAVE                   = 'U' 
*     IS_VARIANT               = 
*     IT_EVENTS                = 
*     IT_EVENT_EXIT            = 
*     IS_PRINT                 = 
*     IS_REPREP_ID             = 
*     I_SCREEN_START_COLUMN    = 0 
*     I_SCREEN_START_LINE      = 0 
*     I_SCREEN_END_COLUMN      = 0 
*     I_SCREEN_END_LINE        = 0 
*     I_HTML_HEIGHT_TOP        = 0 
*     I_HTML_HEIGHT_END        = 0 
*     IT_ALV_GRAPHICS          = 
*     IT_HYPERLINK             = 
*     IT_ADD_FIELDCAT          = 
*     IT_EXCEPT_QINFO          = 
*     IR_SALV_FULLSCREEN_ADAPTER        = 
* IMPORTING 
*     E_EXIT_CAUSED_BY_CALLER  = 
*     ES_EXIT_CAUSED_BY_USER   = 
    TABLES 
      t_outtab                 = gt_list. 
* EXCEPTIONS 
*   PROGRAM_ERROR                     = 1 
*   OTHERS                            = 2 . 

  IF sy-subrc <> 0. 
* Implement suitable error handling here 
  ENDIF. 


FORM standard USING p_extab . 
  "STATUS 
  SET PF-STATUS 'STANDARD'.
ENDFORM. 

 

form user_command using r_ucomm     like sy-ucomm 
                 rs_selfield type slis_selfield. 

 

  case r_ucomm. 
      WHEN 'SAVE'. 
        LOOP AT GT_LIST. 
MOVE-CORRESPONDING gt_list to ls_CKML. 
UPDATE ZFI_CKML_ACD_V1 from ls_CKML. 
COMMIT WORK. 
        ENDLOOP. 
      ENDCASE . 
ENDFORM.  

 








