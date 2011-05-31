Ext.define('Athene.store.Drzava', {
    extend: 'Ext.data.Store',
    model: 'Athene.model.Drzava',
    pageSize: 20,
    proxy: {
        type: 'direct',
        //directFn: Drzava.getAll,
        api: {
            read: Drzava.getAll
            //find: Drzava.find
        },
        reader: {
            root: 'data'
        }
    },
    sorters: [
        {
            property: 'naziv'
        }
    ],
    totalProperty: 'total',
    remoteFilter: true,
    remoteFind: function(params) {
        if(this.proxy.api.find === undefined) {
            throw "Unable to use remoteFind, find API is not defined!";
        } else {
            //console.log(this, field, value);
            var store = this;
            //var returnData;
            this.proxy.api.find(
                params.params,
                function(provider, response) {
                    //console.log(provider, response);
                    if(provider.data.length == 1) {
                        //console.log(provider.data[0]);
                        var returnData = Ext.ModelManager.create(provider.data[0], store.model);
                        //console.log(returnData);
                        if(params.scope !== undefined) {
                            //console.log(params.scope);
                            //params.scope.callback(returnData);
                            //params.callback.this = params.scope;
                            //params.callback(returnData).bind(params.scope);
                            params.callback.call(params.scope, returnData);
                        } else {
                            params.callback(returnData);
                        }
                        //console.log(r);
                    }
                }
            );
            //return returnData;
        }
    },
    /*nextPage: function(callback) {
        console.log('JEBEM MU MATER!'); console.log(callback);
        this.nextPageCallback = callback;
        this.superclass.nextPage.call(this);
    },
    
    listeners: {
        load: function(v,a,r) {
            console.log('LOAD bRE');
            console.log(this.nextPageCallback);
            if(this.nextPageCallback) {
                if(this.nextPageCallback.scope) {
                    console.log('kolbekd asklfkshf');
                    this.nextPageCallback.callback.call(this.nextPageCallback.scope);    
                } else {
                    console.log('mater ti jebem!');
                    this.nextPageCallback.callback();
                }
                //this.nextPageCallback = undefined;
                //console.log('pizda!', this.nextPageCallback);
            }
        }
    }*/
});