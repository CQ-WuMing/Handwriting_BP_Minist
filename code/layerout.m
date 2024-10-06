%激活函数
function output = layerout(weights, biases, inputs)
    % 计算加权和
    weighted_sum = weights * inputs + biases;

    % 使用 sigmoid 激活函数
    output = 1 ./ (1 + exp(-weighted_sum));
end