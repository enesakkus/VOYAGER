import sys
from pathlib import Path
from typing import Dict

from PyQt5.QtQml    import QQmlApplicationEngine
from PyQt5.QtGui    import QGuiApplication
from PyQt5.QtCore   import (
                            QByteArray,
                            QTimer, 
                            QObject, 
                            pyqtSignal, 
                            pyqtSlot, 
                            QAbstractListModel, 
                            QModelIndex, 
                            Qt, 
                            pyqtProperty
                            )

class BoltListModel(QAbstractListModel):
    BoltIdRole = Qt.UserRole + 1000
    BoltXCoordRole = Qt.UserRole + 1001
    BoltYCoordRole = Qt.UserRole + 1002
    BoltZCoordRole = Qt.UserRole + 1003
    BoltKxRole = Qt.UserRole + 1004
    BoltKyRole = Qt.UserRole + 1005
    BoltKzRole = Qt.UserRole + 1006


    def __init__(self, appObj, parent=None):
        super().__init__()
        self._appObj = appObj
        self.bolts = []

    
    def rowCount(self, parent=None,  *args, **kwargs):
        return (len(self.bolts))
    
    def data(self, index, role=Qt.DisplayRole):
        if 0 <= index.row() < self.rowCount() and index.isValid():
            item = self.bolts[index.row()]
            if role == BoltListModel.BoltIdRole:
                return item['boltIdNumber']
            elif role == BoltListModel.BoltXCoordRole:
                return item['boltXCoord']
            elif role == BoltListModel.BoltYCoordRole:
                return item['boltYCoord']
            elif role == BoltListModel.BoltZCoordRole:
                return item['boltZCoord']
            elif role == BoltListModel.BoltKxRole:
                return item['boltKx']
            elif role == BoltListModel.BoltKyRole:
                return item['boltKy']
            elif role == BoltListModel.BoltKzRole:
                return item['boltKz']
            
    def roleNames(self):
        roles = dict()
        roles[BoltListModel.BoltIdRole] = b"boltIdNumber"
        roles[BoltListModel.BoltXCoordRole] = b"boltXCoord"
        roles[BoltListModel.BoltYCoordRole] = b"boltYCoord"
        roles[BoltListModel.BoltZCoordRole] = b"boltZCoord"
        roles[BoltListModel.BoltKxRole] = b"boltKx"
        roles[BoltListModel.BoltKyRole] = b"boltKy"
        roles[BoltListModel.BoltKzRole] = b"boltKz"
        return roles
    
    @pyqtSlot()
    def appendBolt(self):
        self.beginInsertRows(QModelIndex(), self.rowCount(), self.rowCount())
        self.bolts.append({"boltIdNumber" : self.assignBoltId(), "boltXCoord" : float(0), 
                           "boltYCoord" : float(0), "boltZCoord" : float(0), "boltKx": float(1.0), 
                           "boltKy": float(1.0), "boltKz": float(1.0)})
        self.endInsertRows()

    @pyqtSlot()
    def resetBoltListModel(self):
        self.beginResetModel()
        self.bolts = []
        self.endResetModel()

    @pyqtSlot(str)
    def deleteBolt(self,rowNum):
        self.beginRemoveRows(QModelIndex(), int(rowNum), int(rowNum))
        self.bolts.remove(self.bolts[int(rowNum)])
        self.endRemoveRows()

    def assignBoltId(self):
        if len(self.bolts) != 0:
            for id in range(1,9999):
                isUnique = True
                for bolt in self.bolts:
                    if bolt['boltIdNumber'] == id:
                        isUnique = False
                        break
                if isUnique:
                    return id
        else:
            return 1
        
    @pyqtSlot(str, str, str)
    def editBoltParameters(self, rowNum, roleName, value):
        if(roleName == "boltIdNumber"):
            isUnique = True
            for bolt in self.bolts:
                if bolt['boltIdNumber'] == int(value):
                    isUnique = False
                    break
            if isUnique:
                self.bolts[int(rowNum)][roleName] = int(value)
            else:
                self.beginResetModel()
                self.endResetModel()

        else:
            self.bolts[int(rowNum)][roleName] = float(value)

class BoltGroupListModel(QAbstractListModel):
    BoltGroupNameRole = Qt.UserRole + 1000
    subItemsRole = Qt.UserRole + 1001

    def __init__(self, appObj, parent=None):
        super().__init__()
        self._appObj = appObj   
        self.boltGroups = []

    
    def rowCount(self, parent=None,  *args, **kwargs):
        return (len(self.boltGroups))
    
    def data(self, index, role=Qt.DisplayRole):
        if 0 <= index.row() < self.rowCount() and index.isValid():
            item = self.boltGroups[index.row()]
            if role == BoltGroupListModel.BoltGroupNameRole:
                return item['boltGroupName']
            elif role == BoltGroupListModel.subItemsRole:
                return item['subItems']
        return None
            
    def roleNames(self):
        roles = dict()
        roles[BoltGroupListModel.BoltGroupNameRole] = b"boltGroupName"
        roles[BoltGroupListModel.subItemsRole] = b"subItems"
        return roles
    
    @pyqtSlot(str, QObject)
    def appendBoltGroup(self, boltGroupName, obj):
        print(boltGroupName)
        self.subItem = BoltListModel(self._appObj)
        self.subItem.bolts = obj.bolts.copy()
        self.beginInsertRows(QModelIndex(), self.rowCount(), self.rowCount())
        self.boltGroups.append({"boltGroupName":boltGroupName, "subItems":self.subItem})
        self.endInsertRows()

    @pyqtSlot(str)
    def deleteBoltGroup(self,rowNum):
        self.beginRemoveRows(QModelIndex(), int(rowNum), int(rowNum))
        self.boltGroups.remove(self.boltGroups[int(rowNum)])
        self.endRemoveRows()



class DirectLoadListModel(QAbstractListModel):
    BoltIdRole = Qt.UserRole + 1000
    BoltXCoordRole = Qt.UserRole + 1001
    BoltYCoordRole = Qt.UserRole + 1002
    BoltZCoordRole = Qt.UserRole + 1003
    BoltKxRole = Qt.UserRole + 1004
    BoltKyRole = Qt.UserRole + 1005
    BoltKzRole = Qt.UserRole + 1006


    def __init__(self, appObj, parent=None):
        super().__init__()
        self._appObj = appObj
        self.bolts = []

    
    def rowCount(self, parent=None,  *args, **kwargs):
        return (len(self.bolts))
    
    def data(self, index, role=Qt.DisplayRole):
        if 0 <= index.row() < self.rowCount() and index.isValid():
            item = self.bolts[index.row()]
            if role == BoltListModel.BoltIdRole:
                return item['boltIdNumber']
            elif role == BoltListModel.BoltXCoordRole:
                return item['boltXCoord']
            elif role == BoltListModel.BoltYCoordRole:
                return item['boltYCoord']
            elif role == BoltListModel.BoltZCoordRole:
                return item['boltZCoord']
            elif role == BoltListModel.BoltKxRole:
                return item['boltKx']
            elif role == BoltListModel.BoltKyRole:
                return item['boltKy']
            elif role == BoltListModel.BoltKzRole:
                return item['boltKz']
            
    def roleNames(self):
        roles = dict()
        roles[BoltListModel.BoltIdRole] = b"boltIdNumber"
        roles[BoltListModel.BoltXCoordRole] = b"boltXCoord"
        roles[BoltListModel.BoltYCoordRole] = b"boltYCoord"
        roles[BoltListModel.BoltZCoordRole] = b"boltZCoord"
        roles[BoltListModel.BoltKxRole] = b"boltKx"
        roles[BoltListModel.BoltKyRole] = b"boltKy"
        roles[BoltListModel.BoltKzRole] = b"boltKz"
        return roles
    
    @pyqtSlot()
    def appendDirectLoad(self):
        self.beginInsertRows(QModelIndex(), self.rowCount(), self.rowCount())
        self.bolts.append({"boltIdNumber" : self.assignBoltId(), "boltXCoord" : float(0), 
                           "boltYCoord" : float(0), "boltZCoord" : float(0), "boltKx": float(1.0), 
                           "boltKy": float(1.0), "boltKz": float(1.0)})
        self.endInsertRows()

    @pyqtSlot()
    def resetBoltListModel(self):
        self.beginResetModel()
        self.bolts = []
        self.endResetModel()

    @pyqtSlot(str)
    def deleteBolt(self,rowNum):
        self.beginRemoveRows(QModelIndex(), int(rowNum), int(rowNum))
        self.bolts.remove(self.bolts[int(rowNum)])
        self.endRemoveRows()

    def assignBoltId(self):
        if len(self.bolts) != 0:
            for id in range(1,9999):
                isUnique = True
                for bolt in self.bolts:
                    if bolt['boltIdNumber'] == id:
                        isUnique = False
                        break
                if isUnique:
                    return id
        else:
            return 1
        
    @pyqtSlot(str, str, str)
    def editBoltParameters(self, rowNum, roleName, value):
        if(roleName == "boltIdNumber"):
            isUnique = True
            for bolt in self.bolts:
                if bolt['boltIdNumber'] == int(value):
                    isUnique = False
                    break
            if isUnique:
                self.bolts[int(rowNum)][roleName] = int(value)
            else:
                self.beginResetModel()
                self.endResetModel()

        else:
            self.bolts[int(rowNum)][roleName] = float(value)



class Hdf5LoadListModel(QAbstractListModel):
    BoltIdRole = Qt.UserRole + 1000
    BoltXCoordRole = Qt.UserRole + 1001
    BoltYCoordRole = Qt.UserRole + 1002
    BoltZCoordRole = Qt.UserRole + 1003
    BoltKxRole = Qt.UserRole + 1004
    BoltKyRole = Qt.UserRole + 1005
    BoltKzRole = Qt.UserRole + 1006


    def __init__(self, appObj, parent=None):
        super().__init__()
        self._appObj = appObj
        self.bolts = []

    
    def rowCount(self, parent=None,  *args, **kwargs):
        return (len(self.bolts))
    
    def data(self, index, role=Qt.DisplayRole):
        if 0 <= index.row() < self.rowCount() and index.isValid():
            item = self.bolts[index.row()]
            if role == BoltListModel.BoltIdRole:
                return item['boltIdNumber']
            elif role == BoltListModel.BoltXCoordRole:
                return item['boltXCoord']
            elif role == BoltListModel.BoltYCoordRole:
                return item['boltYCoord']
            elif role == BoltListModel.BoltZCoordRole:
                return item['boltZCoord']
            elif role == BoltListModel.BoltKxRole:
                return item['boltKx']
            elif role == BoltListModel.BoltKyRole:
                return item['boltKy']
            elif role == BoltListModel.BoltKzRole:
                return item['boltKz']
            
    def roleNames(self):
        roles = dict()
        roles[BoltListModel.BoltIdRole] = b"boltIdNumber"
        roles[BoltListModel.BoltXCoordRole] = b"boltXCoord"
        roles[BoltListModel.BoltYCoordRole] = b"boltYCoord"
        roles[BoltListModel.BoltZCoordRole] = b"boltZCoord"
        roles[BoltListModel.BoltKxRole] = b"boltKx"
        roles[BoltListModel.BoltKyRole] = b"boltKy"
        roles[BoltListModel.BoltKzRole] = b"boltKz"
        return roles
    
    @pyqtSlot()
    def appendhdf5Load(self):
        self.beginInsertRows(QModelIndex(), self.rowCount(), self.rowCount())
        self.bolts.append({"boltIdNumber" : self.assignBoltId(), "boltXCoord" : float(0), 
                           "boltYCoord" : float(0), "boltZCoord" : float(0), "boltKx": float(1.0), 
                           "boltKy": float(1.0), "boltKz": float(1.0)})
        self.endInsertRows()

    @pyqtSlot()
    def resetBoltListModel(self):
        self.beginResetModel()
        self.bolts = []
        self.endResetModel()

    @pyqtSlot(str)
    def deleteBolt(self,rowNum):
        self.beginRemoveRows(QModelIndex(), int(rowNum), int(rowNum))
        self.bolts.remove(self.bolts[int(rowNum)])
        self.endRemoveRows()

    def assignBoltId(self):
        if len(self.bolts) != 0:
            for id in range(1,9999):
                isUnique = True
                for bolt in self.bolts:
                    if bolt['boltIdNumber'] == id:
                        isUnique = False
                        break
                if isUnique:
                    return id
        else:
            return 1
        
    @pyqtSlot(str, str, str)
    def editBoltParameters(self, rowNum, roleName, value):
        if(roleName == "boltIdNumber"):
            isUnique = True
            for bolt in self.bolts:
                if bolt['boltIdNumber'] == int(value):
                    isUnique = False
                    break
            if isUnique:
                self.bolts[int(rowNum)][roleName] = int(value)
            else:
                self.beginResetModel()
                self.endResetModel()

        else:
            self.bolts[int(rowNum)][roleName] = float(value)



class boltGroupBackend (QObject):
    boltModelChanged        = pyqtSignal(bool)
    boltGroupModelChanged   = pyqtSignal(bool)
    directLoadModelChanged  = pyqtSignal(bool)
    hdf5LoadModelChanged    = pyqtSignal(bool)
    def __init__(self, applicationObject):
        super().__init__()
        self.appObj = applicationObject
        self._boltModel = BoltListModel(self.appObj)
        self._boltGroupModel = BoltGroupListModel(self.appObj)
        self._directLoadModel = DirectLoadListModel(self.appObj)
        self._hdf5LoadModel = Hdf5LoadListModel(self.appObj)
        

    printToStatusBar = pyqtSignal(str)

    @pyqtSlot(str)
    def printMessage(self, text):
        self.printToStatusBar.emit(text + " Ethem Enes...")

    @pyqtProperty(QObject, constant=False,  notify=boltModelChanged)
    def boltModel(self):
        return self._boltModel
    
    @pyqtProperty(QObject, constant=False,  notify=boltGroupModelChanged)
    def boltGroupModel(self):
        return self._boltGroupModel    

    @pyqtProperty(QObject, constant=False,  notify=directLoadModelChanged)
    def directLoadModel(self):
        return self._directLoadModel
    
    @pyqtProperty(QObject, constant=False,  notify=hdf5LoadModelChanged)
    def hdf5LoadModel(self):
        return self._hdf5LoadModel




class MainWindow():
    def __init__(self):
        app = QGuiApplication(sys.argv)
        self.engine = QQmlApplicationEngine()
        self.engine.quit.connect(app.quit)
        self.engine.load('qml_files/main.qml')

        bolt_group_backend = boltGroupBackend(app)
        self.engine.rootObjects()[0].findChild(QObject, "bolt_group_base_object").setProperty("boltGroupBackend", bolt_group_backend)

        sys.exit(app.exec())

def main():
    window = MainWindow()

if __name__ == '__main__':
    main()