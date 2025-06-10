namespace com.salesOrdes;

using {
    cuid,
    sap.common.CodeList
} from '@sap/cds/common';

entity Headers : cuid {

    key email        : String(30);
        firstname    : String(30);
        lastname     : String(30);
        country      : String(30);
        createon     : Date;
        deliverydate : Date;
        orderstatus  : Association to Status;
        imagenUrl    : String(255);
        toItems      : Composition of many Items
                           on toItems.headers = $self;
}

entity Items : cuid {


        name             : String(40);
        description      : String(40);
        releasedate      : Date;
        discontinueddate : Date;
        price            : Decimal(12, 2);
        height           : Decimal(15, 3);
        width            : Decimal(13, 2);
        depth            : Decimal(12, 2);
        quantity         : Decimal(16, 2);
        unitofmeasure    : String(3) default 'CM';
    key headers          : Association to Headers;

}

entity Status : CodeList {
    key code        : String(10) enum {

            Canceled = 'Canceled';
            InProcess = 'In Process';
            Delivered = 'Delivered';
        };
        criticality : Integer;

}
