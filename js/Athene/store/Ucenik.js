Ext.define('Athene.store.Ucenik', {
    extend: 'Ext.data.Store',
    model: 'Athene.model.Ucenik',
    pageSize: 20,
    totalProperty: 'total',
    filters: {
        property: 'prezime'
    },
    remoteFilter: true
});