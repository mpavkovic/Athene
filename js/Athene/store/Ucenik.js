Ext.define('Athene.store.Ucenik', {
    extend: 'Ext.data.Store',
    model: 'Athene.model.Ucenik',
    proxy: {
        type: 'direct',
        directFn: Ucenik.getAll
    }
});