Ext.define('Athene.store.UcenikRazred', {
    extend: 'Ext.data.Store',
    model: 'Athene.model.UcenikRazred',
    pageSize: 20,
    proxy: {
        type: 'direct',
        directFn: UcenikRazred.getAll,
        reader: {
            root: 'data'
        }
    },
    //idProperty: 'oib',
    totalProperty: 'total',
    remoteFilter: true
});