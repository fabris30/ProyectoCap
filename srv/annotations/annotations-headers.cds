using {SalesOrdes as services} from '../service';
using from './annotations-items';


annotate services.Headers with @odata.draft.enabled;


annotate services.Headers with {

    email        @title: 'Email';
    firstname    @title: 'First Name';
    lastname     @title: 'Last Name';
    country      @title: 'Country';
    createon     @title: 'Create On';
    deliverydate @title: 'Delivey Date';
    orderstatus  @title: 'Order Status';
    imagenUrl    @title: 'Image URL';

};

annotate services.Headers with {

    orderstatus @Common: {

        Text           : orderstatus.name,
        TextArrangement: #TextOnly
    };
    ID          @Common: {ValueList: {
        $Type         : 'Common.ValueListType',
        CollectionPath: 'Headers',
        Parameters    : [{
            $Type            : 'Common.ValueListParameterOut',
            LocalDataProperty: ID,
            ValueListProperty: 'ID',
        }, ],
    }, };
    firstname   @Common: {ValueList: {
        $Type         : 'Common.ValueListType',
        CollectionPath: 'Headers',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterOut',
                LocalDataProperty: firstname,
                ValueListProperty: 'firstname',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'ID',
            },

        ],
    }, };
    createon    @Common: {ValueList: {
        $Type         : 'Common.ValueListType',
        CollectionPath: 'Headers',
        Parameters    : [{
            $Type            : 'Common.ValueListParameterOut',
            LocalDataProperty: createon,
            ValueListProperty: 'createon',
        }, ],
    }, };


};


annotate services.Headers with @(

    Common.SemanticKey      : [

        ID,
        email

    ],

    UI.HeaderInfo           : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Header',
        TypeNamePlural: 'Headers',
        Title         : {
            $Type: 'UI.DataField',
            Value: firstname
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: ID
        },
        ImageUrl      : {$value: imagenUrl,

        }

    },

    UI.SelectionFields      : [

        ID,
        firstname,
        createon,
        orderstatus_code,


    ],
    UI.LineItem             : [
        {
            $Type: 'UI.DataField',
            Value: ID,
        },
        {
            $Type: 'UI.DataField',
            Value: email,
        },
        {
            $Type: 'UI.DataField',
            Value: firstname,
        },
        {
            $Type: 'UI.DataField',
            Value: lastname,
        },
        {
            $Type: 'UI.DataField',
            Value: country,
        },
        {
            $Type: 'UI.DataField',
            Value: createon,
        },
        {
            $Type: 'UI.DataField',
            Value: deliverydate,
        },
        {
            $Type      : 'UI.DataField',
            Value      : orderstatus_code,
            Criticality: orderstatus.criticality
        },
        {
            $Type: 'UI.DataField',
            Value: imagenUrl,
            ![@UI.Hidden],
        },
    ],

    UI.FieldGroup #Header   : {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: firstname,
            },
            {
                $Type: 'UI.DataField',
                Value: lastname,
            },

        ]
    },
    UI.FieldGroup #HeaderDES: {
        $Type: 'UI.FieldGroupType',
        Data : [

            {
                $Type: 'UI.DataField',
                Value: country,
            },
            {
                $Type: 'UI.DataField',
                Value: createon,
            }

        ]
    },
    UI.FieldGroup #HeaderSA : {
        $Type: 'UI.FieldGroupType',
        Data : [

            {
                $Type: 'UI.DataField',
                Value: deliverydate,
            },
            {
                $Type      : 'UI.DataField',
                Value      : orderstatus_code,
                Criticality: orderstatus.criticality
            },

            {
                $Type: 'UI.DataField',
                Value: imagenUrl,
            },
        ]
    },
    UI.FieldGroup #Items    : {
        $Type: 'UI.FieldGroupType',
        Data : [

            {
                $Type: 'UI.DataField',
                Value: toItems.ID
            },
            {
                $Type: 'UI.DataField',
                Value: toItems.name
            }
        ]
    },

    UI.HeaderFacets         : [
        {
            $Type : 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#Header',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#HeaderDES',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#HeaderSA',
        },
    ],
    UI.Facets               : [{
        $Type : 'UI.ReferenceFacet',
        Target: 'toItems/@UI.LineItem',
        Label : 'Items'

    }, ]
);
