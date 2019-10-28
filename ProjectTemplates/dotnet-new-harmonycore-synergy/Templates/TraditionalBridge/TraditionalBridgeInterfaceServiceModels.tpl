<CODEGEN_FILENAME><INTERFACE_NAME>ServiceModels.dbl</CODEGEN_FILENAME>
<REQUIRES_CODEGEN_VERSION>5.4.5</REQUIRES_CODEGEN_VERSION>
<REQUIRES_USERTOKEN>MODELS_NAMESPACE</REQUIRES_USERTOKEN>
;//****************************************************************************
;//
;// Title:       InterfaceServiceModels.tpl
;//
;// Type:        CodeGen Template
;//
;// Description: Creates request and response models for a service class that
;//              exposes former xfServerPlus methods in an interface via Harmony
;//              Core Traditional Bridge
;//
;// Copyright (c) 2019, Synergex International, Inc. All rights reserved.
;//
;// Redistribution and use in source and binary forms, with or without
;// modification, are permitted provided that the following conditions are met:
;//
;// * Redistributions of source code must retain the above copyright notice,
;//   this list of conditions and the following disclaimer.
;//
;// * Redistributions in binary form must reproduce the above copyright notice,
;//   this list of conditions and the following disclaimer in the documentation
;//   and/or other materials provided with the distribution.
;//
;// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
;// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
;// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
;// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
;// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
;// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
;// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
;// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
;// CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
;// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
;// POSSIBILITY OF SUCH DAMAGE.
;//
;;*****************************************************************************
;;
;; Title:       <INTERFACE_NAME>ServiceModels.dbl
;;
;; Description: Request and response models for methods that are part of the
;;              former xfServerPlus / xfNetLink "<INTERFACE_NAME>" interface.
;;
;;*****************************************************************************
;; WARNING: GENERATED CODE!
;; This file was generated by CodeGen. Avoid editing the file if possible.
;; Any changes you make will be lost of the file is re-generated.
;;*****************************************************************************

import System
import System.ComponentModel.DataAnnotations
import <MODELS_NAMESPACE>

namespace <NAMESPACE>
  public class <INTERFACE_NAME>
  <METHOD_LOOP>
  
  ;;--------------------------------------------------------------------------------
  ;; <METHOD_NAME>
  ;//
  ;// REQUEST MODEL
  ;//
    <IF IN_OR_INOUT>
  
      ;;; <summary>
      ;;; Represents IN parameters for method <INTERFACE_NAME>.<METHOD_NAME>.
      ;;; </summary>
      public class <METHOD_NAME>_Request
        <PARAMETER_LOOP>
          <IF IN_OR_INOUT>
  
          <IF REQUIRED>
          {Required(ErrorMessage="<PARAMETER_NAME> is required")}
          </IF REQUIRED>
          <IF ALPHA>
          {StringLength(<PARAMETER_SIZE>,ErrorMessage="<PARAMETER_NAME> is limited to <PARAMETER_SIZE> characters")}
          </IF ALPHA>
          ;;; <summary>
          ;;; Parameter <PARAMETER_NUMBER> (<PARAMETER_REQUIRED> <PARAMETER_DIRECTION> <PARAMETER_DEFINITION>)
          <IF COMMENT>
          ;;; <PARAMETER_COMMENT>
          <ELSE>
          ;;; No description found in method catalog
          </IF COMMENT>
          ;;; </summary>
          public readwrite property <PARAMETER_NAME>, <HARMONYCORE_BRIDGE_PARAMETER_TYPE>
          </IF IN_OR_INOUT>
        </PARAMETER_LOOP>
  
      endclass
    </IF IN_OR_INOUT>
  ;//
  ;// RESPONSE MODEL
  ;//
    <IF RETURNS_DATA>
  
      ;;; <summary>
      ;;; Represents OUT parameters<IF FUNCTION> and return value</IF FUNCTION> for method <INTERFACE_NAME>.<METHOD_NAME>.
      ;;; </summary>
      public class <METHOD_NAME>_Response
      <IF FUNCTION>
  
          ;;; <summary>
          ;;; Return value
          ;;; </summary>
          public readwrite property ReturnValue, <HARMONYCORE_BRIDGE_RETURN_TYPE>
      </IF FUNCTION>
      <IF OUT_OR_INOUT>
        <PARAMETER_LOOP>
          <IF OUT_OR_INOUT>
  
          ;;; <summary>
          ;;; Parameter <PARAMETER_NUMBER> (<PARAMETER_REQUIRED> <PARAMETER_DIRECTION> <PARAMETER_DEFINITION>)
          <IF COMMENT>
          ;;; <PARAMETER_COMMENT>
          <ELSE>
          ;;; No description found in method catalog
          </IF COMMENT>
          ;;; </summary>
          public readwrite property <PARAMETER_NAME>, <HARMONYCORE_BRIDGE_PARAMETER_TYPE><IF STRING>, String.Empty</IF STRING><IF ALPHA>, String.Empty</IF ALPHA>
          </IF OUT_OR_INOUT>
        </PARAMETER_LOOP>
      </IF OUT_OR_INOUT>
  
      endclass
  
    </IF RETURNS_DATA>
  </METHOD_LOOP>
  endclass
endnamespace
