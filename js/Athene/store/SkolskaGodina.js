Ext.define('Athene.store.SkolskaGodina', {
    extend: 'Ext.data.Store',
    model: 'Athene.model.SkolskaGodina', // Must be full path to model
    proxy: {
        type: 'direct',
        directFn: SkolskaGodina.getAll
    },
    sorters: {
        property: 'godina',
        direction: 'DESC'
    },
    /*load: function() {
        console.log('Data is being loaded...');
        console.log();
        this.each(function(record) {
            console.log(record);
        })
        //this.callParent(arguments);
    }*/
});