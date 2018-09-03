<CODEGEN_FILENAME>EdmBuilder.dbl</CODEGEN_FILENAME>
<REQUIRES_CODEGEN_VERSION>5.3.5</REQUIRES_CODEGEN_VERSION>
<REQUIRES_USERTOKEN>MODELS_NAMESPACE</REQUIRES_USERTOKEN>
;//****************************************************************************
;//
;// Title:       ODataEdmBuilder.tpl
;//
;// Type:        CodeGen Template
;//
;// Description: Used to create OData EDM builder class in a Harmony Core environment
;//
;// Copyright (c) 2018, Synergex International, Inc. All rights reserved.
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
;; Title:       EdmBuilder.dbl
;;
;; Description: Builds a Harmony Core Enterprise Data Model (EDM)
;;
;;*****************************************************************************
;; WARNING: GENERATED CODE!
;; This file was generated by CodeGen. Avoid editing the file if possible.
;; Any changes you make will be lost of the file is re-generated.
;;*****************************************************************************

import Harmony.Core
import Harmony.Core.Context
import Harmony.OData
import Microsoft.EntityFrameworkCore
import Microsoft.OData.Edm
import Microsoft.AspNet.OData.Builder
import System.Collections.Generic
import <MODELS_NAMESPACE>

namespace <NAMESPACE>

    ;;; <summary>
    ;;; Builds an entity framework entity data model.
    ;;; </summary>
    public class EdmBuilder

        private static mEdmModel, @IEdmModel

        ;;; <summary>
        ;;; Gets the entity data model.
        ;;; </summary>
        public static method GetEdmModel, @IEdmModel
            required in serviceProvider, @IServiceProvider
        proc
            if(mEdmModel == ^null)
            begin
                data builder = new ODataConventionModelBuilder(serviceProvider)

                ;;Declare entities
<STRUCTURE_LOOP>
                builder.EntitySet<<StructureNoplural>>("<StructurePlural>")
</STRUCTURE_LOOP>

                ;;Entities with a single primary key segment have the key declared to EF via a
                ;;{Key} attribute on the appropriate property in the data model, but only one {key}
                ;;attribute can be used in a class, so keys with multiple segments are defined
                ;;using the "Fluent API" here.
<STRUCTURE_LOOP>
  <IF STRUCTURE_ISAM>
    <PRIMARY_KEY>
        <IF MULTIPLE_SEGMENTS>
            <SEGMENT_LOOP>
                builder.EntityType<<StructureNoplural>>().HasKey<<StructureNoplural>,<FIELD_CSTYPE>>("<FieldSqlname>")
            </SEGMENT_LOOP>
        </IF MULTIPLE_SEGMENTS>
    </PRIMARY_KEY>
  </IF STRUCTURE_ISAM>
  <IF STRUCTURE_RELATIVE>
                builder.EntityType<<StructureNoplural>>().HasKey<<StructureNoplural>,int>("RecordNumber")
  </IF STRUCTURE_RELATIVE>
</STRUCTURE_LOOP>

                data tempModel = (@EdmModel)builder.GetEdmModel()
                <STRUCTURE_LOOP>

                data <structureNoplural>Type = (@EdmEntityType)tempModel.FindDeclaredType("<MODELS_NAMESPACE>.<StructureNoplural>")
                <IF STRUCTURE_ISAM>
                <ALTERNATE_KEY_LOOP>
                tempModel.AddAlternateKeyAnnotation(<structureNoplural>Type, new Dictionary<string, IEdmProperty>() {<SEGMENT_LOOP>{"<SegmentName>",<structureNoplural>Type.FindProperty("<SegmentName>")}<,></SEGMENT_LOOP>})
                </ALTERNATE_KEY_LOOP>
                </IF STRUCTURE_ISAM>
                </STRUCTURE_LOOP>

                mEdmModel = tempModel
            end

            mreturn mEdmModel

        endmethod

    endclass

endnamespace