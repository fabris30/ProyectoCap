using {SalesOrdes as services} from '../service';

annotate services.Headers with {

    email        @title: 'Email';
    firstname    @title: 'First Name';
    lastname     @title: 'Last Name';
    country      @title: 'Country';
    createon     @title: 'Createon';
    deliverydate @title: 'Delivey Date';
    orderstatus  @title: 'Order Status';
    imagenUrl    @title: 'Image URL';

};

annotate services.Headers with {

 orderstatus @Common: {

         Text : orderstatus.name,
         TextArrangement : #TextOnly
    }
   
};


annotate services.Headers with @(

   Common.SemanticKey : [

      ID,
      email

   ],

    UI.HeaderInfo     : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Header',
        TypeNamePlural: 'Headers',
    },

    UI.SelectionFields: [

        ID,
        firstname,
        createon,
        orderstatus_code,


    ],
    UI.LineItem       : [
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
            $Type: 'UI.DataField',
            Value: orderstatus_code,
           Criticality : orderstatus.criticality

        }
    ],

);

