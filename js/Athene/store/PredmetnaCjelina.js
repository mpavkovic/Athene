Ext.define('Athene.store.PredmetnaCjelina', {
    extend: 'Ext.data.Store',
    model: 'Athene.model.PredmetnaCjelina',
    proxy: {
        type: 'direct',
        directFn: PredmetnaCjelina.getAll
    },
    sorters: [
        {
            property: 'naziv'
        }
    ]
});