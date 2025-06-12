using {SalesOrdes as services} from '../service';


annotate services.Items with {

    name             @title: 'Name';
    description      @title: 'Description';
    releasedate      @title: 'Release Date';
    discontinueddate @title: 'Discontinued Date';
    price            @title: 'Price'            @Measures.ISOCurrency: currency_code;
    currency         @title: 'Currency'         @Common.IsCurrency;
    height           @title: 'Height'           @Measures.Unit       : unitofmeasure;
    width            @title: 'Width'            @Measures.Unit       : unitofmeasure;
    depth            @title: 'Depth'            @Measures.Unit       : unitofmeasure;
    quantity         @title: 'Quantity';
    unitofmeasure    @title: 'Unit to Measure'  @Common.IsUnit;


};

annotate services.Items with @(

    UI.HeaderInfo          : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Item',
        TypeNamePlural: 'Items',
        Title         : {
            $Type: 'UI.DataField',
            Value: headers.firstname
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: headers.ID
        }

    },

    UI.LineItem            : [


        {
            $Type: 'UI.DataField',
            Value: ID,
        },
        {
            $Type: 'UI.DataField',
            Value: name,
        },
        {
            $Type: 'UI.DataField',
            Value: description,
        },
        {
            $Type: 'UI.DataField',
            Value: releasedate,
        },
        {
            $Type: 'UI.DataField',
            Value: discontinueddate,
        },
        {
            $Type: 'UI.DataField',
            Value: price,
        },
        {
            $Type: 'UI.DataField',
            Value: height,
        },
        {
            $Type: 'UI.DataField',
            Value: width,
        },
        {
            $Type: 'UI.DataField',
            Value: depth,
        },
        {
            $Type: 'UI.DataField',
            Value: quantity,
        }
        

    ],
    UI.FieldGroup #Itemsdet: {

        $Type: 'UI.FieldGroupType',
        Data : [

            {
                $Type: 'UI.DataField',
                Value: ID,
            },
            {
                $Type: 'UI.DataField',
                Value: name,
            },
            {
                $Type: 'UI.DataField',
                Value: description,
            },
            {
                $Type: 'UI.DataField',
                Value: releasedate,
            },
            {
                $Type: 'UI.DataField',
                Value: discontinueddate,
            },
            {
                $Type: 'UI.DataField',
                Value: price,
            },
            {
                $Type: 'UI.DataField',
                Value: height,
            },
            {
                $Type: 'UI.DataField',
                Value: width,
            },
            {
                $Type: 'UI.DataField',
                Value: depth,
            },
            {
                $Type: 'UI.DataField',
                Value: quantity,
            }
        ]
    },
    UI.Facets              : [{
        $Type : 'UI.ReferenceFacet',
        Target: '@UI.FieldGroup#Itemsdet',
        Label : 'Items',
    }]
);
