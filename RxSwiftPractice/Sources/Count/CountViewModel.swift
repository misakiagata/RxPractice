import RxSwift
import RxCocoa

class CountViewModel: RxViewModelType {
    var outputs: RxViewModelOutput?
    
    private let countRelay = BehaviorRelay<Int>(value: 0)
    private let initialCount = 0
    private let disposeBag = DisposeBag()
    
    required init(input: RxViewModelInput) {
        self.outputs = self
        clearCount()
        
        input.plusButton
            .subscribe(onNext: { [weak self] in
                self?.incrementCount()
            })
            .disposed(by: disposeBag)
        
        input.minusButton
            .subscribe(onNext: { [weak self] in
                self?.decrementCount()
            })
            .disposed(by: disposeBag)
        
        input.clearButton
            .subscribe(onNext: { [weak self] in
                self?.clearCount()
            })
            .disposed(by: disposeBag)
    }
    
    private func incrementCount() {
        let count = countRelay.value + 1
        countRelay.accept(count)
    }
    
    private func decrementCount() {
        let count = countRelay.value - 1
        countRelay.accept(count)
    }
    
    private func clearCount() {
        countRelay.accept(initialCount)
    }
}

struct RxViewModelInput {
    let plusButton: Observable<Void>
    let minusButton: Observable<Void>
    let clearButton: Observable<Void>
}

protocol RxViewModelOutput {
    var counterText: Driver<String> { get }
}

protocol RxViewModelType {
    var outputs: RxViewModelOutput? { get }
    init(input: RxViewModelInput)
}

extension CountViewModel: RxViewModelOutput {
    var counterText: SharedSequence<DriverSharingStrategy, String> {
        let countText = countRelay
            .map {
                "\($0)"
        }
            .asDriver(onErrorJustReturn: "")
        return countText
    }
}
