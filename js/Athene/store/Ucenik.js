Ext.define('Athene.store.Ucenik', {
    extend: 'Ext.data.Store',
    model: 'Athene.model.Ucenik',
    pageSize: 20,
    proxy: {
        type: 'direct',
        directFn: Ucenik.getAll,
        reader: {
            root: 'data'
        }
    },
    //idProperty: 'oib',
    totalProperty: 'total',
    filters: {
        property: 'prezime'
    },
    remoteFilter: true
});