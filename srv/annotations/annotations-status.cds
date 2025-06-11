using { SalesOrdes as services } from '../service';

annotate services.Status with {

    code @title : 'Order Status' @Common : { 
         Text : name,
         TextArrangement : #TextOnly,
     };
};

