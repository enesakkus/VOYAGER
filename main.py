import sys
from PyQt5.QtQml    import QQmlApplicationEngine
from PyQt5.QtGui    import QGuiApplication


class MainWindow():
    def __init__(self):
        app = QGuiApplication(sys.argv)
        self.engine = QQmlApplicationEngine()
        self.engine.quit.connect(app.quit)
        self.engine.load('qml_files/main.qml')

        sys.exit(app.exec())

def main():
    window = MainWindow()

if __name__ == '__main__':
    main()